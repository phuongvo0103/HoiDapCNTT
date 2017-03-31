package model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Account;
import model.bean.Answer;
import model.bean.Message;
import model.bean.Question;
import model.bean.Tag;

public class BasicDAO {
	BaseDAO baseDAO = new BaseDAO();

	public Account getAccount(String username, String password) {
		Account acc = null;
		if (baseDAO.connect()) {
			String sql = String.format("select * from tblAccount where UserName=N'%s' and Pass=N'%s'", username,
					password);
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						acc = getAccount(rs);
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		return acc;
	}

	public int getVoteAnswer(int accountID, int answerID) {
		int vote = 0;
		if (baseDAO.connect()) {
			String sql = String.format("select Voted from tblVoteAnswer where AccountID=%s and AnswerID=%s", accountID,
					answerID);
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						vote = rs.getInt("Voted");
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}

		return vote;
	}

	public int getVoteQuestion(int accountID, int questionID) {
		int vote = 0;
		if (baseDAO.connect()) {
			String sql = String.format("select Voted from tblVoteQuestion where AccountID=%s and QuestionID=%s",
					accountID, questionID);
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						vote = rs.getInt("Voted");
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}

		return vote;
	}

	public String getAccountName(int accountID) {
		String accountName = "";
		if (baseDAO.connect()) {
			String sql = String.format("select UserName from tblAccount where AccountID=%s", accountID);
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						accountName = rs.getString("UserName");
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		System.out.println("acc:" + accountName);
		return accountName;
	}

	public String getQuestionTitle(int questionID) {
		String title = "";
		if (baseDAO.connect()) {
			String sql = String.format("select Title from tblQuestion where QuestionID=%s", questionID);
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						title = rs.getString("Title");
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		System.out.println("title:" + title);
		return title;
	}

	public boolean insertAccount(Account account) {
		boolean e = false;
		if (account != null) {
			if (baseDAO.connect()) {
				String sql = String.format("exec createAccount N'%s',N'%s',N'%s'", account.getUserName(),
						account.getPass(), account.getEmail());
				ResultSet rs = baseDAO.sqlExeQUERY(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
							System.out.println("out:" + iReturn);
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public boolean updateAccount(Account account) {
		boolean e = false;
		if (account != null) {
			if (baseDAO.connect()) {
				String sql = String.format("exec updateAccount N'%s',N'%s',N'%s','%s',N'%s',N'%s',N'%s',N'%s',%s",
						account.getImg(), account.getDisplayName(), account.getEmail(), account.getBirthDate(),
						account.getLocation(), account.getAboutMe(), account.getCareer(), account.getCompanyName(),
						account.getAccountID());
				ResultSet rs = baseDAO.sqlExeQUERY(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	// type=0 ,1,2 , can viet them thu tuc de thuc hien
	public boolean lockAccount(int accountID, int type) {
		boolean e = false;
		if (accountID >= 0) {
			if (baseDAO.connect()) {
				String sql = String.format("exec lockAccount %s,%s", accountID, type);
				e = baseDAO.sqlExeUPDATE(sql);
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public boolean insertTag(Tag tag) {
		boolean e = false;
		if (tag != null) {
			if (baseDAO.connect()) {
				String sql = String.format("insert into tblTag(TagName,DescriptionDetails,STT) values(N'%s',N'%s',%s)",
						tag.getTagName(), tag.getDescriptionDetails(), tag.getStt());
				e = baseDAO.sqlExeUPDATE(sql);
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public boolean updateTag(Tag tag) {
		boolean e = false;
		if (tag != null) {
			if (baseDAO.connect()) {
				String sql = String.format(
						"update tblTag set TagName=N'%s',DescriptionDetails=N'%s',TagPoint=%s,STT=%s where TagID=%s",
						tag.getTagName(), tag.getDescriptionDetails(), tag.getTagPoint(), tag.getStt(), tag.getTagID());
				e = baseDAO.sqlExeUPDATE(sql);
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public boolean limitTag(int tagID, int stt) {// STT=-1 delete ,STT=0 lock,
													// STT=1 open
		boolean e = false;
		if (tagID > 0) {
			if (baseDAO.connect()) {
				String sql = String.format("update tblTag set STT=%s where TagID=%s", stt, tagID);
				e = baseDAO.sqlExeUPDATE(sql);
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public Tag getTag(ResultSet rs) {
		Tag tag = null;
		if (rs != null) {
			try {
				tag = new Tag();
				tag.setTagID(rs.getInt("TagID"));
				tag.setTagName(rs.getString("TagName"));
				tag.setTagPoint(rs.getInt("TagPoint"));
				tag.setDescriptionDetails(rs.getString("DescriptionDetails"));
				tag.setCreationDate(rs.getDate("CreationDate"));
				tag.setStt(rs.getInt("STT"));
				tag.setTotalUse(rs.getInt("totalUse"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return tag;
	}

	public Tag getTag_(ResultSet rs) {
		Tag tag = null;
		if (rs != null) {
			try {
				tag = new Tag();
				tag.setTagID(rs.getInt("TagID"));
				tag.setTagName(rs.getString("TagName"));
				tag.setTagPoint(rs.getInt("TagPoint"));
				tag.setDescriptionDetails(rs.getString("DescriptionDetails"));
				tag.setCreationDate(rs.getDate("CreationDate"));
				tag.setStt(rs.getInt("STT"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return tag;
	}

	public Account getAccount(ResultSet rs) {
		Account acc = null;
		if (rs != null) {
			try {
				acc = new Account();
				acc.setAccountID(rs.getInt("AccountID"));
				acc.setUserName(rs.getString("UserName"));
				acc.setPass(rs.getString("Pass"));
				acc.setEmail(rs.getString("Email"));
				acc.setDisplayName(rs.getString("DisplayName"));
				acc.setStartDate(rs.getDate("StartDate"));
				acc.setBirthDate(rs.getDate("BirthDate"));
				acc.setLocation(rs.getString("Location"));
				acc.setAboutMe(rs.getString("AboutMe"));
				acc.setCareer(rs.getString("Career"));
				acc.setCompanyName(rs.getString("CompanyName"));
				acc.setTotalAnswer(rs.getInt("TotalAnswer"));
				acc.setTotalQuestion(rs.getInt("TotalQuestion"));
				acc.setTotalTag(rs.getInt("TotalTag"));
				acc.setReputationPoint(rs.getInt("ReputationPoint"));
				acc.setImg(rs.getString("Img"));
				acc.setStt(rs.getInt("STT"));
				acc.setLastSeen(rs.getDate("LastSeen"));
				acc.setLockDate(rs.getDate("LockDate"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return acc;
	}

	public boolean viewAnswer(int answerID, int accountID) {
		boolean e = false;
		if (answerID >= 0) {
			if (baseDAO.connect()) {
				String sql = String.format("exec viewAnswer %s,%s", answerID, accountID);
				ResultSet rs = baseDAO.sqlExeProcedure(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	// can co phuong thuc insert cau tra loi
	public boolean insertAnswer(Answer answer) {
		boolean e = false;
		if (answer != null) {
			if (baseDAO.connect()) {
				String sql = String.format("exec insertAnswer %s,%s,N'%s'", answer.getAccountID(),
						answer.getQuestionID(), answer.getAnswerBody());
				ResultSet rs = baseDAO.sqlExeProcedure(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public boolean updateAnswer(Answer answer) {
		boolean e = false;
		if (answer != null) {
			if (baseDAO.connect()) {
				String sql = String.format("exec updateAnswer %s,%s,N'%s'", answer.getAccountID(), answer.getAnswerID(),
						answer.getAnswerBody());
				ResultSet rs = baseDAO.sqlExeProcedure(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public boolean limitAnswer(int answerID, int stt) {
		boolean e = false;
		if (answerID >= 0) {
			if (baseDAO.connect()) {
				String sql = String.format("exec limitAnswer %s,%s", answerID, stt);
				e = baseDAO.sqlExeUPDATE(sql);
				baseDAO.disConnect();
			}
		}
		return e;
	}

	/*
	 * type=-1 vote down, type!=-1 vote up
	 */
	public boolean voteAnswer(int answerID, int accountID, int voted) {
		boolean e = false;
		if (answerID >= 0 && accountID >= 0) {
			if (baseDAO.connect()) {
				String sql = String.format("exec voteAnswer %s,%s,%s", answerID, accountID, voted);
				ResultSet rs = baseDAO.sqlExeProcedure(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
							System.out.println("mã:" + iReturn);
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public Answer getAnswer(ResultSet rs) {
		Answer answer = null;
		if (rs != null) {
			try {
				answer = new Answer();
				answer.setAnswerID(rs.getInt("AnswerID"));
				answer.setAccountID(rs.getInt("AccountID"));
				answer.setQuestionID(rs.getInt("QuestionID"));
				answer.setAnswerBody(rs.getString("AnswerBody"));
				answer.setTotalVote(rs.getInt("TotalVote"));
				answer.setIsViewed(rs.getInt("IsViewed"));
				answer.setCreationDate(rs.getDate("CreationDate"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return answer;
	}

	public Question getQuestion(ResultSet rs) {
		Question q = null;
		if (rs != null) {
			try {
				q = new Question();
				q.setQuestionID(rs.getInt("QuestionID"));
				q.setAccountID(rs.getInt("AccountID"));
				q.setTitle(rs.getString("Title"));
				q.setQuestionBody(rs.getString("QuestionBody"));
				q.setEditDate(rs.getDate("EditDate"));
				q.setTotalVote(rs.getInt("TotalVote"));
				q.setTotalAnswer(rs.getInt("TotalAnswer"));
				q.setTotalView(rs.getInt("TotalView"));
				q.setIsLock(rs.getInt("IsLock"));
				q.setIsViewed(rs.getInt("IsViewed"));
				q.setCreationDate(rs.getDate("CreationDate"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return q;
	}

	public boolean insertMessage(Message message) {
		boolean e = false;
		if (message != null) {
			if (baseDAO.connect()) {

				String sql = String.format("exec insertMessage %s,%s,N'%s'", message.getAccountSendID(),
						message.getAccountReceiveID(), message.getMessage());
				ResultSet rs = baseDAO.sqlExeProcedure(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public Message getMessage(ResultSet rs) {
		Message msg = null;
		if (rs != null) {
			try {
				int ordNumber = rs.getInt("OrdNumber");
				int messageID = rs.getInt("MessageID");
				int accountSendID = rs.getInt("AccountSendID");
				int accountReceiveID = rs.getInt("AccountReceiveID");
				String content = rs.getString("Content");
				msg = new Message(ordNumber, messageID, accountSendID, accountReceiveID, content);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return msg;
	}

	public Tag getTag(int tagID) {

		Tag tag = null;
		if (baseDAO.connect()) {
			String sql = "select * from tblTag where TagID=" + tagID;
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						tag = getTag_(rs);
					rs.close();
					if (tag != null) {
						rs = baseDAO.sqlExeQUERY(
								"select count(QuestionID)as 'totalUse' from tblQuestionTag where TagID=" + tagID);
						if (rs != null) {
							if (rs.next()) {
								int totalUse = rs.getInt("totalUse");
								tag.setTotalUse(totalUse);
							}
							rs.close();
						}
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		return tag;
	}

	public Account getAccount(int accountID) {

		Account acc = null;
		if (baseDAO.connect()) {
			String sql = "select * from tblAccount where AccountID=" + accountID;
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						acc = getAccount(rs);
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		return acc;
	}

	public ArrayList<Tag> getListTag(int questionID) {
		ArrayList<Tag> listTag = new ArrayList<>();
		if (baseDAO.connect()) {
			String sql = "select * from  (select * from tblQuestionTag where QuestionID=" + questionID
					+ ")as tblOut1 inner join tblTag  on tblTag.TagID=tblOut1.TagID";
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					while (rs.next()) {
						Tag tag = getTag_(rs);
						if (tag != null)
							listTag.add(tag);
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		return listTag;
	}

	public ArrayList<Answer> getListAnswer(int questionID) {
		ArrayList<Answer> listAnswer = new ArrayList<>();
		if (baseDAO.connect()) {
			String sql = "select * from tblAnswer where QuestionID=" + questionID;
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					while (rs.next()) {
						Answer answer = getAnswer(rs);
						if (answer != null)
							listAnswer.add(answer);
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		return listAnswer;
	}

	public Question getFullQuestion(int questionID, int accountID) {
		Question q = null;
		if (baseDAO.connect()) {
			String sql = "select * from tblQuestion where QuestionID=" + questionID;
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						q = getQuestion(rs);
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
			if (q != null) {
				q.setAccountName(getAccountName(q.getAccountID()));
				q.setListTag(getListTag(q.getQuestionID()));
				q.setListAnswer(getListAnswer(q.getQuestionID()));
				if (q.getListAnswer() != null) {
					for (Answer answer : q.getListAnswer()) {
						answer.setAccountName(getAccountName(answer.getAccountID()));
						if (accountID > 0)
							answer.setVote(getVoteAnswer(accountID, answer.getAnswerID()));
					}
				}
				if (accountID > 0) {
					q.setVote(getVoteQuestion(accountID, questionID));
				}
			}
		}
		return q;
	}

	public Question getFullQuestionSmall(int questionID) {
		Question q = null;
		if (baseDAO.connect()) {
			String sql = "select * from tblQuestion where QuestionID=" + questionID;
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						q = getQuestion(rs);
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
			if (q != null) {
				q.setAccountName(getAccountName(q.getAccountID()));
				q.setListTag(getListTag(q.getQuestionID()));
				q.setListAnswer(getListAnswer(q.getQuestionID()));
				if (q.getListAnswer() != null) {
					for (Answer answer : q.getListAnswer()) {
						answer.setAccountName(getAccountName(answer.getAccountID()));
					}
				}
			}
		}
		return q;
	}

	/**
	 * 
	 * @param questionID
	 *            :id cua cau hoi can lay du lieu
	 * @return question
	 */
	public Question getQuestion(int questionID) {
		Question q = null;
		if (baseDAO.connect()) {
			String sql = "select * from tblQuestion where QuestionID=" + questionID;
			ResultSet rs = baseDAO.sqlExeQUERY(sql);
			if (rs != null) {
				try {
					if (rs.next())
						q = getQuestion(rs);
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			baseDAO.disConnect();
		}
		return q;
	}

	/**
	 * 
	 * @param question
	 *            return 0 loi chua tao question return =1 là đăng bài thành
	 *            công return=-1 là Tài khoản đang bị khóa' return=-2 Sau 30
	 *            phút mới đăng được return=-3 lỗi trong quá trình cập nhật cơ
	 *            sở dữ liệu
	 * @return
	 */
	public int insertQuestion(Question question) {// da co thu tuc cho thu
													// tuc
		int e = 0;
		if (question != null) {
			if (baseDAO.connect()) {
				String sqlTag = "";
				int c = 0;
				if (question.getListTag() != null) {
					for (Tag tag : question.getListTag()) {
						if (c == 0)
							sqlTag += "N'" + tag.getTagName() + "'";
						else
							sqlTag += ",N'" + tag.getTagName() + "'";
						c++;
					}
				}
				for (int i = c; i < 5; i++) {
					if (i == 0)
						sqlTag += "N''";
					else
						sqlTag += ",N''";

				}
				String sql = String.format("exec sp_PostQuestion %s,N'%s',N'%s',%s", question.getAccountID(),
						question.getTitle(), question.getQuestionBody(), sqlTag);
				ResultSet rs = baseDAO.sqlExeProcedure(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							e = rs.getInt("RETURN");
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public boolean viewQuestion(int questionID, int accountID) {
		boolean e = false;
		if (questionID >= 0) {
			if (baseDAO.connect()) {
				String sql = String.format("exec viewQuestion %s,%s", questionID, accountID);
				ResultSet rs = baseDAO.sqlExeProcedure(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public boolean updateQuestion(Question question) {
		boolean e = false;
		if (question != null) {
			if (baseDAO.connect()) {
				String sql = String.format("exec updateQuestion %s,%s,N'%s',N'%s',%s", question.getQuestionID(),
						question.getAccountID(), question.getTitle(), question.getQuestionBody(), question.getIsLock());
				ResultSet rs = baseDAO.sqlExeProcedure(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}

	// can thu tuc lockQuestion
	public boolean limitQuestion(int questionID, int isLock) {
		boolean e = false;
		if (questionID >= 0) {
			if (baseDAO.connect()) {
				String sql = String.format("exec limitQuestion %s,%s", questionID, isLock);
				e = baseDAO.sqlExeUPDATE(sql);
				baseDAO.disConnect();
			}
		}
		return e;
	}

	public boolean voteQuestion(int questionID, int accountID, int voted) {
		boolean e = false;
		if (questionID >= 0 && accountID >= 0) {
			if (baseDAO.connect()) {
				String sql = String.format("exec voteQuestion %s,%s,%s", questionID, accountID, voted);
				ResultSet rs = baseDAO.sqlExeQUERY(sql);
				if (rs != null) {
					try {
						if (rs.next()) {
							int iReturn = rs.getInt("RETURN");
							if (iReturn == 1)
								e = true;
						}
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				}
				baseDAO.disConnect();
			}
		}
		return e;
	}
}
