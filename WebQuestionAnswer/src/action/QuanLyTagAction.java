package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.TagForm;
import model.bean.Account;
import model.bean.Tag;
import model.bo.TagBO;

public class QuanLyTagAction extends Action {
	TagBO tagBO = new TagBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println("encoding:" + request.getCharacterEncoding());
		TagForm tagForm = (TagForm) form;
		System.out.println("đàgfhghjhgfdsádfgh");
		HttpSession session = request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		tagForm.setAccount(account);
		if (account != null)
			modifyTag(tagForm);
		String txtSearch = tagForm.getTxtSearch();
		System.out.println("chuỗi tìm kiếm:" + txtSearch);
		int c = tagForm.getC();
		int o = tagForm.getO();
		int type = tagForm.getType();
		int order = tagForm.getOrder();
		int page = tagForm.getPage();
		int numRowsOnPage = 5;
		if (0 == o)
			page++;
		else if (1 == o)
			page--;
		tagForm.setPage(page);
		tagForm.setO(2);
		if (c == 1) {
			if (order == 1)
				order = 0;
			else
				order = 1;
			tagForm.setOrder(order);
			tagForm.setC(0);
		}
		ArrayList<Tag> listTag = tagBO.getListTag(txtSearch, type, order, page, numRowsOnPage);

		tagForm.setTagList(listTag);
		tagForm.setPage(tagBO.getPage());
		tagForm.setNumPage(tagBO.getNumPage());
		tagForm.setPageStart(tagBO.getPageStart());
		tagForm.setPageEnd(tagBO.getPageEnd());
		tagForm.setListPage(tagBO.getListPage());
		return mapping.findForward("dsTag");
	}

	private boolean modifyTag(TagForm tagForm) {
		System.out.println(tagForm.getTagName() + "Test");

		int tagID = tagForm.getTagID();
		String s = tagForm.getSubmit();
		int typeExe = tagForm.getTypeExe();
		if (typeExe < 0 && typeExe > 2)
			typeExe = 0;
		tagForm.setTypeExe(typeExe);
		boolean e = false;
		if (tagID > 0) {
			if (s != null && typeExe > 0) {
				if (typeExe == 1)// sá»­a
				{
					String tagName = tagForm.getTagName();
					int tagPoint = tagForm.getTagPoint();
					String DescriptionDetails = tagForm.getDescriptionDetails();

					int stt = tagForm.getStt();
					if (stt < -1 && stt > 1)
						stt = 0;
					Tag tag = new Tag(tagID, tagName, tagPoint, DescriptionDetails, stt);
					e = tagBO.updateTag(tag);
					if (e)
						tagForm.setErr("Chá»‰nh sá»­a thÃ nh cÃ´ng");
					else
						tagForm.setErr("Chá»‰nh sá»­a tháº¥t báº¡i");
				} else if (typeExe == 2)// xÃ³a
				{
					if (tagBO.limitTag(tagID, -1))
						tagForm.setErr("XÃ³a thÃ nh cÃ´ng");
					else
						tagForm.setErr("XÃ³a tháº¥t báº¡i");
				}

			} else {
				System.out.println("tagid:" + tagID);
				Tag tag = tagBO.getTag(tagID);
				if (tag != null) {
					System.out.println("tag:" + tag);
					tagForm.setTagName(tag.getTagName());
					tagForm.setTagPoint(tag.getTagPoint());
					tagForm.setDescriptionDetails(tag.getDescriptionDetails());
					tagForm.setStt(tag.getStt());
					tagForm.setTotalUse(tag.getTotalUse());
					System.out.println(" 2");
					e = true;
				}
			}
		}
		return e;
	}
}