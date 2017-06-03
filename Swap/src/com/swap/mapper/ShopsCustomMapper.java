package com.swap.mapper;

import java.util.List;

import com.swap.po.Page;
import com.swap.po.Shops;
import com.swap.po.ShopsCollection;
import com.swap.po.ShopsCustom;

public interface ShopsCustomMapper {
    ShopsCustom userAndShopQuery(Integer userid);

    ShopsCustom userAndShopSelect(Integer shopid);

    List<ShopsCollection> shopsCollectionSelect(Integer userid);

    int updateReputationvalue(Shops record);

    Shops selectByShopname(String shopname);

	int getShopsCount();

	List<ShopsCustom> adminQueryShops(Page page);

	List<ShopsCustom> adminSearchShop(String keyword);
}
