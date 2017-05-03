package com.swap.search;

import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.DataSourceMapper;
import com.swap.po.Goods;

public class SearchGoods {


    @Autowired
    private DataSourceMapper dataSourceMapper;
    private final ResourceBundle resource;



    public SearchGoods() {
        //获得资源文件
        resource = ResourceBundle.getBundle("path");
    }


    /**
    * <p>Title:SearchGoodsInfo </p>
    * <p>Description: 搜索索引</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年5月9日
     */
    public List<Goods> SearchGoodsInfo(String goodsInfo) throws Exception{
        //检索数据初始化
        Directory dir=FSDirectory.open(Paths.get(resource.getString("swapindex.path")));
    //    Directory dir=FSDirectory.open(Paths.get("E:\\lucene\\swap"));
    //    Directory dir=FSDirectory.open(Paths.get("/home/ubuntu/swapindex/"));
        IndexReader indexReader=DirectoryReader.open(dir);
        IndexSearcher indexSearcher=new IndexSearcher(indexReader);
        SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();

        //匹配四个字段
        QueryParser parser1=new QueryParser("goodsname", analyzer);
        Query query1=parser1.parse(goodsInfo);
        QueryParser parser2=new QueryParser("intention", analyzer);
        Query query2=parser2.parse(goodsInfo);
        QueryParser parser3=new QueryParser("bigclassify", analyzer);
        Query query3=parser3.parse(goodsInfo);
        QueryParser parser4=new QueryParser("smallclassify", analyzer);
        Query query4=parser4.parse(goodsInfo);
        //组合查询
        BooleanQuery.Builder booleanQuery=new BooleanQuery.Builder();
        booleanQuery.add(query1,BooleanClause.Occur.SHOULD);
        booleanQuery.add(query2,BooleanClause.Occur.SHOULD);
        booleanQuery.add(query3,BooleanClause.Occur.SHOULD);
        booleanQuery.add(query4,BooleanClause.Occur.SHOULD);
        //控制检索条件和搜索条数
        TopDocs hits=indexSearcher.search(booleanQuery.build(), 60);

        //获得检索到的id的集合
        List<Integer> goodsIds=new ArrayList<Integer>();
        for(ScoreDoc scoreDoc:hits.scoreDocs){
            Document doc=indexSearcher.doc(scoreDoc.doc);
            goodsIds.add(Integer.parseInt(doc.get("id")));
        }
        indexReader.close();

        //从数据库读取数据
        List<Goods> goods=null;
        if(goodsIds.size()>0){
            goods=dataSourceMapper.searchGoodsInfo(goodsIds);
        }

        return goods;
    }


    /**
    * <p>Title:testDeleteAfterMerge </p>
    * <p>Description:删除索引 </p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年5月9日
     */
    public void DeleteGoodsInfo(Integer id)throws Exception{
        Directory dir=FSDirectory.open(Paths.get(resource.getString("swapindex.path")));
    //    Directory dir=FSDirectory.open(Paths.get("E:\\lucene\\swap"));
    //    Directory dir=FSDirectory.open(Paths.get("/home/ubuntu/swapindex/"));
        SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();
        IndexWriterConfig  iwc=new IndexWriterConfig(analyzer);
        IndexWriter writer=new IndexWriter(dir,iwc);
        writer.deleteDocuments(new Term("id", String.valueOf(id)));
        writer.forceMergeDeletes();  //强制删除
        writer.commit();
        writer.close();
    }

    /**
    * <p>Title:AddGoodsInfo </p>
    * <p>Description: 添加索引</p>
    * <p>Company: </p>
    * @author guanghui
    * @date 2016年5月9日
     */
    public void AddGoodsInfo(Goods goods)throws Exception{
        Directory dir=FSDirectory.open(Paths.get(resource.getString("swapindex.path")));
    //    Directory dir = FSDirectory.open(Paths.get("E:\\lucene\\swap"));
    //    Directory dir = FSDirectory.open(Paths.get("/home/ubuntu/swapindex/"));
        SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();  //中文分词器，注意：不会对StringField字段进行分词
        IndexWriterConfig iwc=new IndexWriterConfig(analyzer);
        IndexWriter indexWriter=new IndexWriter(dir, iwc);

        Document document=new Document();
        document.add(new StringField("id",String.valueOf(goods.getId()),Field.Store.YES));
        document.add(new TextField("goodsname",String.valueOf(goods.getGoodsname()),Field.Store.YES));//TextField会对字段进行分词
        document.add(new TextField("intention",String.valueOf(goods.getIntention()),Field.Store.YES));
        document.add(new TextField("bigclassify",String.valueOf(goods.getBigclassify()),Field.Store.YES));
        document.add(new TextField("smallclassify",String.valueOf(goods.getSmallclassify()),Field.Store.YES));

        indexWriter.addDocument(document);
        indexWriter.close();
    }
}
