package form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import model.bean.Account;
import model.bean.Question;
import model.bean.Tag;

public class ThongKeForm extends ActionForm {

	private int type;
	private int orderType;
	private int stt;
	private String userName;
	private String title;
	private String questionBody;
	private String postDate;
	private int totalVote;
	private int totalAnswer;
	private int totalView;
	private ArrayList<Question> listQuestion;
	private ArrayList<Account> listAccount;
	private ArrayList<Tag> listTag;
	private Account account = null;

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getOrderType() {
		return orderType;
	}

	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}

	public ArrayList<Question> getListQuestion() {
		return listQuestion;
	}

	public void setListQuestion(ArrayList<Question> listQuestion) {
		this.listQuestion = listQuestion;
	}

	public ArrayList<Account> getListAccount() {
		return listAccount;
	}

	public void setListAccount(ArrayList<Account> listAccount) {
		this.listAccount = listAccount;
	}

	public ArrayList<Tag> getListTag() {
		return listTag;
	}

	public void setListTag(ArrayList<Tag> listTag) {
		this.listTag = listTag;
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
