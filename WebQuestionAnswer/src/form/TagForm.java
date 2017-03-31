package form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Account;
import model.bean.Tag;

public class TagForm extends ActionForm {
	private int tagID = 0;
	private String tagName = "";
	private int totalUse = 0;
	private int tagPoint = 0;
	private String descriptionDetails;
	private int stt = 1;
	private String dateCreation;
	private String submit = null;
	private ArrayList<Tag> tagList = new ArrayList<>();
	private int type = 0;
	private int order = 0;
	private String txtSearch = "";
	private int numPage = 0;
	private int pageStart = 0, pageEnd = 0;
	private ArrayList<String> listPage = new ArrayList<>();
	private int page = 0;
	private int typeExe = 0;// =1 sửa,=2 xóa ,còn lại là xem
	private String err;
	private int c = 0;
	private int o = 2;
	private Account account = null;

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public int getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}

	public int getO() {
		return o;
	}

	public void setO(int o) {
		this.o = o;
	}

	public String getErr() {
		return err;
	}

	public void setErr(String err) {
		this.err = err;
	}

	public int getTypeExe() {
		return typeExe;
	}

	public void setTypeExe(int typeExe) {
		this.typeExe = typeExe;
	}

	public int getStt() {
		return stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public String getTxtSearch() {
		return txtSearch;
	}

	public void setTxtSearch(String txtSearch) {
		this.txtSearch = txtSearch;
	}

	public int getNumPage() {
		return numPage;
	}

	public void setNumPage(int numPage) {
		this.numPage = numPage;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public ArrayList<String> getListPage() {
		return listPage;
	}

	public void setListPage(ArrayList<String> listPage) {
		this.listPage = listPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTagPoint() {
		return tagPoint;
	}

	public void setTagPoint(int tagPoint) {
		this.tagPoint = tagPoint;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public int getTotalUse() {
		return totalUse;
	}

	public void setTotalUse(int totalUse) {
		this.totalUse = totalUse;
	}

	public int getTagID() {
		return tagID;
	}

	public void setTagID(int tagID) {
		this.tagID = tagID;
	}

	public String getDescriptionDetails() {
		return descriptionDetails;
	}

	public void setDescriptionDetails(String descriptionDetails) {
		this.descriptionDetails = descriptionDetails;
	}

	public String getDateCreation() {
		return dateCreation;
	}

	public void setDateCreation(String dateCreation) {
		this.dateCreation = dateCreation;
	}

	public ArrayList<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(ArrayList<Tag> tagList) {
		this.tagList = tagList;
	}

	public String getSubmit() {
		return submit;
	}

	public void setSubmit(String submit) {
		this.submit = submit;
	}

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
