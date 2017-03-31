package form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Account;

public class VisitorForm extends ActionForm {

	private ArrayList<Object> listObject;
	private ArrayList<String> listPage;
	private int page = 0;
	private int numPage = 0;
	private int pageStart, pageEnd;
	private int typeSearch = 0;
	private String txtSearch = "";
	private String txtSearchSub = "";
	private int order = 0, type = 0, c = 0, o = 2;
	private int typePage = 2;// =0 page tag,=1 page account,=2 page question
	private Account account = null;
	private ArrayList<Object> listQuestionSam = null;
	private ArrayList<Object> listQuestionTop = null;
	private ArrayList<Object> listTagTop = null;
	private int postOK = 0;

	public int getPostOK() {
		return postOK;
	}

	public void setPostOK(int postOK) {
		this.postOK = postOK;
	}

	public String getTxtSearchSub() {
		return txtSearchSub;
	}

	public void setTxtSearchSub(String txtSearchSub) {
		this.txtSearchSub = txtSearchSub;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public ArrayList<Object> getListTagTop() {
		return listTagTop;
	}

	public void setListTagTop(ArrayList<Object> listTagTop) {
		this.listTagTop = listTagTop;
	}

	public ArrayList<Object> getListQuestionSam() {
		return listQuestionSam;
	}

	public void setListQuestionSam(ArrayList<Object> listQuestionSam) {
		this.listQuestionSam = listQuestionSam;
	}

	public ArrayList<Object> getListQuestionTop() {
		return listQuestionTop;
	}

	public void setListQuestionTop(ArrayList<Object> listQuestionTop) {
		this.listQuestionTop = listQuestionTop;
	}

	public int getTypePage() {
		return typePage;
	}

	public void setTypePage(int typePage) {
		this.typePage = typePage;
	}

	public ArrayList<Object> getListObject() {
		return listObject;
	}

	public void setListObject(ArrayList<Object> listObject) {
		this.listObject = listObject;
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

	public int getTypeSearch() {
		return typeSearch;
	}

	public void setTypeSearch(int typeSearch) {
		this.typeSearch = typeSearch;
	}

	public String getTxtSearch() {
		return txtSearch;
	}

	public void setTxtSearch(String txtSearch) {
		this.txtSearch = txtSearch;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
