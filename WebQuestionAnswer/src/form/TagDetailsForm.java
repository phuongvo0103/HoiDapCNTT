package form;

import java.util.ArrayList;

import org.apache.struts.action.ActionForm;

import model.bean.Account;
import model.bean.Tag;

public class TagDetailsForm extends ActionForm {
	private int tagID = 0;
	private Account account = null;
	private Tag tag = null;
	private ArrayList<Object> listQuestionSam = null;
	private ArrayList<Object> listQuestionTop = null;
	private ArrayList<Object> listTagTop = null;

	public int getTagID() {
		return tagID;
	}

	public void setTagID(int tagID) {
		this.tagID = tagID;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
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

	public ArrayList<Object> getListTagTop() {
		return listTagTop;
	}

	public void setListTagTop(ArrayList<Object> listTagTop) {
		this.listTagTop = listTagTop;
	}

}
