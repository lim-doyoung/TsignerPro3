package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.tsigner.model.entity.CommunityVo;
import com.bit.tsigner.model.entity.Criteria;
import com.bit.tsigner.model.entity.SearchVo;
import com.bit.tsigner.model.entity.TestVo;

public interface SearchDao {

	void searchTest(SearchVo bean);
	void OutofKeyword();
	List<CommunityVo> TagList();

}
