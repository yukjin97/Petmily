package com.petmily.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.petmily.dto.admintest;

@Mapper
@Repository
public interface AdminDAO {

	public List<admintest> membership() throws Exception;

}
