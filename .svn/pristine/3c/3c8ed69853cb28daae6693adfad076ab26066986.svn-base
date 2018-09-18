package eshop_manager.biz;

import java.util.List;

import eshop_manager.entity.QuestionInfo;

public interface QuestionBiz {
	/**
	 * 查询问题列表信息
	 * @return
	 */
	List<QuestionInfo> select_questionlist(String question_title);
	/**
	 * 添加密保问题
	 */
	void addquestion(String addquestion);
	/**
	 修改密保问题
	 * @param question_id
	 */
	void updatequestion(Integer question_id,String question_title);
	
	/**
	 * 删除密保问题
	 * @param question_id
	 */
	void deletequestion(Integer question_id);
	
	/**
	 * 查询所有密保问题信息
	 * @return
	 */
	List<QuestionInfo> selectQuestionList();
}
