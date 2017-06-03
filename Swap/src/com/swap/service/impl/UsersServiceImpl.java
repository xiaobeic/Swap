package com.swap.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.swap.mapper.UsersMapper;
import com.swap.po.Page;
import com.swap.po.Users;
import com.swap.service.UsersService;

public class UsersServiceImpl implements UsersService {

    @Autowired
    public UsersMapper usersMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return usersMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Users record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insertSelective(Users record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public Users selectByPrimaryKey(Integer id) throws Exception {
        // TODO Auto-generated method stub
        return usersMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Users record) throws Exception {
        // TODO Auto-generated method stub
        usersMapper.updateByPrimaryKeySelective(record);
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Users record) throws Exception {
        // TODO Auto-generated method stub
        return 0;
    }

	/* (non-Javadoc)
	 * @see com.swap.service.UsersService#adminQueryUsers()
	 */
	@Override
	public List<Users> adminQueryUsers(Page page) throws Exception {
		return usersMapper.adminQueryUsers(page);
	}

	/* (non-Javadoc)
	 * @see com.swap.service.UsersService#getUsersCount()
	 */
	@Override
	public int getUsersCount() throws Exception {
		return usersMapper.getUsersCount();
	}

	/* (non-Javadoc)
	 * @see com.swap.service.UsersService#adminSearchUsers()
	 */
	@Override
	public List<Users> adminSearchUsers(String keyword) {
		// TODO Auto-generated method stub
		return usersMapper.adminSearchUsers(keyword);
	}

}
