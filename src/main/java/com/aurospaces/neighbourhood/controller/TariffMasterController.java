package com.aurospaces.neighbourhood.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.TariffmasterBean;
import com.aurospaces.neighbourhood.db.dao.TariffmasterDao;

@Controller
@RequestMapping(value="admin")
public class TariffMasterController {
	private Logger logger = Logger.getLogger(TariffMasterController.class);

	@Autowired
	TariffmasterDao objTariffmasterDao;

	@RequestMapping(value="/tariffMaster")
	public String tariffMasterHome(@ModelAttribute("tariffMaster")TariffmasterBean objTariffmasterBean, ModelMap model, HttpServletRequest request,
			HttpSession session){

		
		List<TariffmasterBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			listOrderBeans = objTariffmasterDao.getAllTariffmasterDetails();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in TariffMasterController class in tariffMasterHome method");
		}


		return "tariffMasterHome";
	}

	@RequestMapping(value="/saveTariffDetails")
	public String saveTariffDetails(@ModelAttribute("tariffMaster")TariffmasterBean objTariffmasterBean, ModelMap model,BindingResult result, HttpServletRequest request,
			HttpSession session,RedirectAttributes redir)
	{

		System.out.println("saving tariffDetails page...");
		int id = 0; 
		String name = null;
		TariffmasterBean existModel=null;
		boolean isUpdate=false;

		try {
			if (result.hasErrors()) {
				//				model.addAttribute("newUser", userObj);
				return "tariffMasterHome";
			}
			List<TariffmasterBean> TariffmasterBean = objTariffmasterDao.getByName(objTariffmasterBean);


			if(TariffmasterBean.size() == 0 || TariffmasterBean == null){

				objTariffmasterDao.save(objTariffmasterBean);
				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");}

				else
				{
					for(int i=0;i<TariffmasterBean.size();i++)
					{
						existModel = TariffmasterBean.get(i);
						name = existModel.getAssetcode();
						String exId = existModel.getAssetcode();
						if(exId.equals( objTariffmasterBean.getAssetcode()))
						{
							isUpdate=true;
						}
						else
						{
							redir.addFlashAttribute("msg", "Already Record Exist");
							redir.addFlashAttribute("cssMsg", "danger");
						}
					}
					if(isUpdate){
						objTariffmasterDao.save(objTariffmasterBean);
						redir.addFlashAttribute("msg", "Record Updated Successfully");
						redir.addFlashAttribute("cssMsg", "warning");
					}
				}

			} catch (Exception e) {
				e.printStackTrace();
				//System.out.println(e);
				logger.error(e);
				logger.fatal("error in TariffMaster class saveTariffMasterDetails method");
				redir.addFlashAttribute("msg", e);
			}

		
			return "redirect:tariffMaster";
		
	}
	
	@RequestMapping(value = "/deleteTariffMasterDetails")
	public @ResponseBody String deleteTariffMasterDetails( TariffmasterBean objTariffmasterBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult,RedirectAttributes redir) {
		System.out.println("deleteTariffMasterDetails page...");
		List<TariffmasterBean> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try{
			if(objTariffmasterBean.getId() != 0 && objTariffmasterBean.getStatus() !=""){
 				delete = objTariffmasterDao.delete(objTariffmasterBean.getId(),objTariffmasterBean.getStatus());
 				if(delete){
 					jsonObj.put("message", "Record Deleted Successfully");
 					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "danger");
 				}else{
 					jsonObj.put("message", "Failed to Delete..!");
 				}
 			}
 			listOrderBeans = objTariffmasterDao.getAllTariffmasterDetails();
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) 
			{
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				jsonObj.put("allOrders1", listOrderBeans);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				jsonObj.put("allOrders1", listOrderBeans);
			}
		}catch(Exception e){
			e.printStackTrace();
			//System.out.println(e);
			logger.error(e);
			logger.fatal("error in CompanyMasterController class deleteCompanyMasterDetails method");
			jsonObj.put("message", "excetption"+e);
			return String.valueOf(jsonObj);
		}
		return String.valueOf(jsonObj);
	}

}



