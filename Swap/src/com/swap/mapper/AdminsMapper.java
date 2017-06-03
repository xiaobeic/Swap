package com.swap.mapper;

import com.swap.po.Admins;

public interface AdminsMapper {
    Admins selectByName(String adminname);

}