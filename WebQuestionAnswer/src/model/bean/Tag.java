package model.bean;

import java.sql.Date;

public class Tag {
	private int tagID;
	private String tagName;
	private int tagPoint;
	private String descriptionDetails;
	private Date creationDate;
	private int stt;
	private int totalUse;

	public Tag(int tagID, String tagName, int tagPoint, String descriptionDetails, int stt) {
		super();
		this.tagID = tagID;
		this.tagName = tagName;
		this.tagPoint = tagPoint;
		this.descriptionDetails = descriptionDetails;
		this.stt = stt;
	}

	public int getStt() {
		return stt;
	}

	public int getTotalUse() {
		return totalUse;
	}

	public void setTotalUse(int totalUse) {
		this.totalUse = totalUse;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	/**
	 * 
	 */
	public Tag() {
	}

	/**
	 * @return the tagID
	 */
	public int getTagID() {
		return tagID;
	}

	/**
	 * @param tagID
	 *            the tagID to set
	 */
	public void setTagID(int tagID) {
		this.tagID = tagID;
	}

	/**
	 * @return the tagName
	 */
	public String getTagName() {
		return tagName;
	}

	/**
	 * @param tagName
	 *            the tagName to set
	 */
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	/**
	 * @return the tagPoint
	 */
	public int getTagPoint() {
		return tagPoint;
	}

	/**
	 * @param tagPoint
	 *            the tagPoint to set
	 */
	public void setTagPoint(int tagPoint) {
		this.tagPoint = tagPoint;
	}

	/**
	 * @return the descriptionDetails
	 */
	public String getDescriptionDetails() {
		return descriptionDetails;
	}

	/**
	 * @param descriptionDetails
	 *            the descriptionDetails to set
	 */
	public void setDescriptionDetails(String descriptionDetails) {
		this.descriptionDetails = descriptionDetails;
	}

	/**
	 * @return the creationDate
	 */
	public Date getCreationDate() {
		return creationDate;
	}

	/**
	 * @param creationDate
	 *            the creationDate to set
	 */
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

}
