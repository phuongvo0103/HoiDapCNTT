package action;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import form.ThongTinCaNhanForm;
import model.bean.Account;
import model.bo.ThongTinCaNhanBO;

public class SuaThongTinCaNhanAction extends Action {
	private ThongTinCaNhanBO thongTinCaNhanBO = new ThongTinCaNhanBO();

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ThongTinCaNhanForm thongTinCaNhanForm = (ThongTinCaNhanForm) form;
		String img = "";
		// Truyen AccountID qua form sua
		HttpSession session = request.getSession(true);
		Account account = (Account) session.getAttribute("Account");
		thongTinCaNhanForm.setAccount(account);
		int accountID = 0;
		if (account != null)
			accountID = account.getAccountID();
		FormFile file = thongTinCaNhanForm.getFile();
		// int accountID = thongTinCaNhanForm.getAccountID();
		System.out.println("file" + file);

		String displayName = thongTinCaNhanForm.getDisplayName();
		String email = thongTinCaNhanForm.getEmail();
		Date birthDate = thongTinCaNhanForm.getBirthDate();
		String location = thongTinCaNhanForm.getLocation();
		String aboutMe = thongTinCaNhanForm.getAboutMe();
		String career = thongTinCaNhanForm.getCareer();
		String companyName = thongTinCaNhanForm.getCompanyName();

		if (account != null && "submit".equals(thongTinCaNhanForm.getSubmit())) {

			System.out.println("file" + file);
			if (file != null) {
				// Get the servers upload directory real path name
				String filePath = getServlet().getServletContext().getRealPath("\\") + "\\anh";
				System.out.println("Ä‘Æ°á»�ng dáº«n" + filePath);
				// create the upload folder if not exists
				File folder = new File(filePath);
				if (!folder.exists()) {
					folder.mkdir();
				}

				// create the upload folder if not exists
				folder = new File(filePath);
				if (!folder.exists()) {
					folder.mkdir();
				}
				String fileName = file.getFileName();
				img = fileName;
				if (!("").equals(fileName)) {
					System.out.println("Server path:" + filePath);
					File newFile = new File(filePath, fileName);
					if (!newFile.exists()) {
						FileOutputStream fos = new FileOutputStream(newFile);
						fos.write(file.getFileData());
						fos.flush();
						fos.close();
					}
					request.setAttribute("uploadedFilePath", newFile.getAbsoluteFile());
					request.setAttribute("uploadedFileName", newFile.getName());
				}
			}

			thongTinCaNhanBO.suaThongTinCaNhan(img, displayName, email, birthDate, location, aboutMe, career,
					companyName, accountID);
			System.out.println("10");
			return mapping.findForward("suaTTCNxong");
		} else {
			account = thongTinCaNhanBO.getAccount(accountID);
			if (account != null) {
				thongTinCaNhanForm.setDisplayName(account.getDisplayName());
				thongTinCaNhanForm.setEmail(account.getEmail());
				thongTinCaNhanForm.setBirthDate(account.getBirthDate());
				thongTinCaNhanForm.setLocation(account.getLocation());
				thongTinCaNhanForm.setAboutMe(account.getAboutMe());
				thongTinCaNhanForm.setCareer(account.getCareer());
				thongTinCaNhanForm.setCompanyName(account.getCompanyName());
				thongTinCaNhanForm.setImg(account.getImg());
			}
			System.out.println("20");
			return mapping.findForward("suaTTCN");
		}

	}

}
