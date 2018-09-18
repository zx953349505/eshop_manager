package eshop_manager.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;

import eshop_manager.biz.QuestionBiz;
import eshop_manager.dao.QuestionMapper;
import eshop_manager.entity.QuestionInfo;

public class QuestionBizimpl implements QuestionBiz {
	@Autowired
	private QuestionMapper qm;
	public List<QuestionInfo> select_questionlist(String question_title) {
		// TODO Auto-generated method stub
		return qm.select_questionlist(question_title);
	}

	public void addquestion(String addquestion) {
		// TODO Auto-generated method stub
		qm.addquestion(addquestion);
	}

	public void updatequestion(Integer question_id, String question_title) {
		// TODO Auto-generated method stub
		Map<String, Object> qmap=new  HashMap<String, Object>();
		qmap.put("question_id", question_id);
		qmap.put("question_title", question_title);
		qm.updatequestion(qmap);
	}

	public void deletequestion(Integer question_id) {
		// TODO Auto-generated method stub
		qm.deletequestion(question_id);
	}
	
	public List<QuestionInfo> selectQuestionList() {
		
		return qm.selectQuestionList();
	}

}
