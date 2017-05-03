package com.swap.search;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.ResourceBundle;

import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.DataSourceMapper;
import com.swap.po.Goods;

/**
* <p>Title:DataSourceServiceImpl </p>
* <p>Description: 在项目启动后，spring的bean加载完之后执行afterPropertiesSet（）方法，对数据库需要索引的字段进行初始化</p>
* <p>Company: </p>
* @author guanghui
* @date 2016年5月7日
 */
public class DataSourceIndex implements InitializingBean {

    private final IndexWriter indexWriter;

    @Autowired
    private DataSourceMapper dataSourceMapper;

    /**
     * 初期化indexWriter
     * @throws IOException
     */
    public DataSourceIndex() throws IOException {
        //判断文件是否存在，不存在创建文件夹，存在清空文件夹下的文件
        ResourceBundle resource = ResourceBundle.getBundle("path");
        File file=new File(resource.getString("swapindex.path"));
    //    File file=new File("E:\\lucene\\swap");
    //    File file=new File("/home/ubuntu/swapindex/");
        if(!file.exists()){
            file.mkdir();
        }else{
            File[] files=file.listFiles();
            for(int i=0;i<files.length;i++){
                files[i].delete();
            }
        }
        Directory dir = FSDirectory.open(Paths.get(resource.getString("swapindex.path")));
    //    Directory dir = FSDirectory.open(Paths.get("E:\\lucene\\swap"));
    //    Directory dir = FSDirectory.open(Paths.get("/home/ubuntu/swapindex/"));
        SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();  //中文分词器，注意：不会对StringField字段进行分词
        IndexWriterConfig iwc=new IndexWriterConfig(analyzer);
        indexWriter=new IndexWriter(dir, iwc);
    }


    /**
     * 建立索引
     */
    @Override
    public void afterPropertiesSet() throws Exception {
        //从数据库读取数据
        List<Goods> goods=null;
        try {
            goods= dataSourceMapper.selectAllGoods();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(goods.size()!=0){
            for(Goods good:goods){
                Document document=new Document();
                document.add(new StringField("id",String.valueOf(good.getId()),Field.Store.YES));
                document.add(new TextField("goodsname",String.valueOf(good.getGoodsname()),Field.Store.YES));//TextField会对字段进行分词
                document.add(new TextField("intention",String.valueOf(good.getIntention()),Field.Store.YES));
                document.add(new TextField("bigclassify",String.valueOf(good.getBigclassify()),Field.Store.YES));
                document.add(new TextField("smallclassify",String.valueOf(good.getSmallclassify()),Field.Store.YES));
                try {
                    indexWriter.addDocument(document);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        indexWriter.close();
    }

    }
}
