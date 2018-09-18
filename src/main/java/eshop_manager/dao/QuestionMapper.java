package eshop_manager.dao;

import java.util.List;
import java.util.Map;

import eshop_manager.entity.QuestionInfo;

public interface QuestionMapper {
	/**
	 * ��ѯ�����б���Ϣ
	 * @return
	 */
	List<QuestionInfo> select_questionlist(String question_title);
	/**
	 * �����ܱ�����
	 */
	void addquestion(String addquestion);
	/**
	 �޸��ܱ�����
	 * @param question_id
	 */
	void updatequestion(Map<String, Object> map);
	
	/**
	 * ɾ���ܱ�����
	 * @param question_id
	 */
	void deletequestion(Integer question_id);
	
	/**
	 * ��ѯ�����ܱ�������Ϣ
	 * @return
	 */
	List<QuestionInfo> selectQuestionList();
}