package eshop_manager.controller;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import eshop_manager.biz.QuestionBiz;
import eshop_manager.entity.QuestionInfo;
import eshop_manager.util.MyAnnotation.CheckLoginRequired;


@Controller
@RequestMapping("/question")
public class QuestionController {
	@Autowired
	private QuestionBiz questionBiz;
	@RequestMapping("/select_questionlist")
	@CheckLoginRequired
	public ModelAndView select_questionlist(@RequestParam(value="question_title",required=false) String question_title){
		ModelAndView mv=new ModelAndView();
		System.out.println("question_title is**********"+question_title);
		List<QuestionInfo> questionlist=questionBiz.select_questionlist(question_title);
		System.out.println(questionlist);
		mv.addObject("questionlist", questionlist);
		mv.setViewName("encrypted");
		return mv;
	}
	@RequestMapping("/deletequestion")	
	@CheckLoginRequired
	public  String deletequestion(
			@RequestParam(value="question_id") int question_id)throws Exception{
	
		System.out.println("question_id is **********"+question_id);
		questionBiz.deletequestion(question_id);;
		
		return "redirect:/question/select_questionlist";
	}
	@RequestMapping("/addquestion")	
	@CheckLoginRequired
	public  String addquestion(
			@RequestParam(value="addquestion") String addquestion)throws Exception{
		if(addquestion!=null&&addquestion!=""){
			System.out.println("addquestion is **********"+addquestion);
			questionBiz.addquestion(addquestion);
		}
		
		return "redirect:/question/select_questionlist";
	}
	
	@RequestMapping("/selectQuestionList")
	@CheckLoginRequired
	public @ResponseBody List<QuestionInfo> selectQuestionList()
			throws Exception{
		
		List<QuestionInfo> questionList=questionBiz.selectQuestionList();	

		return questionList;//响应结果给ajax请求

	}
	
}
