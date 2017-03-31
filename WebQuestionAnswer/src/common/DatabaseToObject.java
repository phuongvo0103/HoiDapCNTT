package common;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

class ForeignKeyObject {
	private ArrayList<String> foreignKey;
	private String foreignTable;

	public ForeignKeyObject() {
		foreignKey = new ArrayList<>();
	}

	public ArrayList<String> getForeignKey() {
		return foreignKey;
	}

	public void setForeignKey(ArrayList<String> foreignKey) {
		this.foreignKey = foreignKey;
	}

	public String getForeignTable() {
		return foreignTable;
	}

	public void setForeignTable(String foreignTable) {
		this.foreignTable = foreignTable;
	}

}

public class DatabaseToObject {
	public static String createTable(Object objKey, String[] keys, String sAutoIncreament,
			ArrayList<Object> objForeign) {
		if (objKey == null)
			return "";
		ArrayList<ForeignKeyObject> foreignkeys = new ArrayList<>();
		int i = 0, j = 0;
		StringBuilder sb = new StringBuilder();
		Class clas = objKey.getClass();
		Field[] f = clas.getDeclaredFields();
		String tablename = clas.getSimpleName();
		String tablenameForeign = "";
		if (objForeign != null) {
			for (Object objforeignkey : objForeign) {
				Class clasf = objforeignkey.getClass();
				Field[] ff = clasf.getDeclaredFields();
				tablenameForeign = clasf.getSimpleName();
				ForeignKeyObject fkey = new ForeignKeyObject();
				fkey.setForeignTable(tablenameForeign);
				for (i = 0; i < f.length; i++) {
					String fname = f[i].getName();
					String fnamelow = fname.toLowerCase();
					String ftype = f[i].getType().getSimpleName();
					for (j = 0; j < ff.length; j++) {
						if (fnamelow.equals(ff[j].getName().toLowerCase())
								&& ftype.equals(ff[j].getType().getSimpleName())) {
							fkey.getForeignKey().add(fname);
							break;
						}
					}
				}
				foreignkeys.add(fkey);
			}
		}
		sb.append("create table " + tablename + "(");
		boolean eb = false;
		String stemp = "";
		if (sAutoIncreament != null)
			stemp = sAutoIncreament.toLowerCase();
		for (i = 0; i < f.length; i++) {
			String fname = f[i].getName();
			String fnamelow = fname.toLowerCase();
			String ftype = f[i].getType().getSimpleName();
			if (i > 0)
				sb.append(',');
			if (fnamelow.equals(stemp)
					&& ("int".equals(ftype) || "Integer".equals(ftype) || "long".equals(ftype) || "Long".equals(ftype)))
				sb.append(fname + " int identity(1,1)");
			else {
				if ("Date".equals(ftype))
					sb.append(fname + " date");
				else if ("String".equals(ftype)) {
					eb = false;
					if (keys != null)
						for (j = 0; j < keys.length; j++) {
							if (fnamelow.equals(stemp)) {
								eb = true;
								break;
							}
						}
					if (!eb) {
						for (ForeignKeyObject fkey : foreignkeys) {
							for (String fokey : fkey.getForeignKey()) {
								if (fnamelow.equals(fokey)) {
									eb = true;
									break;
								}
							}
						}
					}
					if (eb)
						sb.append(fname + " nvarchar(20) not null");
					else
						sb.append(fname + " nvarchar(255)");
				} else if ("int".equals(ftype) || "Integer".equals(ftype) || "long".equals(ftype)
						|| "Long".equals(ftype)) {
					eb = false;
					for (j = 0; j < keys.length; j++) {
						if (fnamelow.equals(stemp)) {
							eb = true;
							break;
						}
					}
					if (!eb) {
						for (ForeignKeyObject fkey : foreignkeys) {
							for (String fokey : fkey.getForeignKey()) {
								if (fnamelow.equals(fokey)) {
									eb = true;
									break;
								}
							}
						}
					}
					if (eb)
						sb.append(fname + " int not null");
					else
						sb.append(fname + " int");
				} else if ("float".equals(ftype) || "Float".equals(ftype) || "double".equals(ftype)
						|| "Double".equals(ftype)) {
					eb = false;
					if (keys != null)
						for (j = 0; j < keys.length; j++) {
							if (fnamelow.equals(stemp)) {
								eb = true;
								break;
							}
						}
					if (!eb) {
						for (ForeignKeyObject fkey : foreignkeys) {
							for (String fokey : fkey.getForeignKey()) {
								if (fnamelow.equals(fokey)) {
									eb = true;
									break;
								}
							}
						}
					}
					if (eb)
						sb.append(fname + " float not null");
					else
						sb.append(fname + " float");
				}

			}
		}
		eb = false;
		if (keys != null && keys.length > 0) {
			sb.append(",primary key (");
			for (j = 0; j < keys.length; j++) {
				if (j > 0)
					sb.append(',');
				sb.append(keys[j]);
			}
			sb.append(')');
		}
		for (ForeignKeyObject fkey : foreignkeys) {
			sb.append(",foreign key (");
			j = 0;
			for (String fokey : fkey.getForeignKey()) {
				if (j > 0)
					sb.append(',');
				sb.append(fokey);
				j++;
			}
			sb.append(") references " + fkey.getForeignTable());
			sb.append('(');
			j = 0;
			for (String fokey : fkey.getForeignKey()) {
				if (j > 0)
					sb.append(',');
				sb.append(fokey);
				j++;
			}
			sb.append(')');
		}
		sb.append(')');
		return sb.toString();
	}

	public static Object getObject(Object obj, ResultSet rs) {
		if (obj == null || rs == null)
			return null;
		Class clas = obj.getClass();
		Field[] f = clas.getDeclaredFields();
		Method[] m = clas.getDeclaredMethods();
		try {
			Object objnew = clas.newInstance();
			ResultSetMetaData metadata = rs.getMetaData();
			int columnCount = metadata.getColumnCount();
			int i = 0;
			int j = 0, k = 0;
			boolean eb = false;
			for (i = 0; i < f.length; i++) {
				String fname = f[i].getName().toLowerCase();
				String ftype = f[i].getType().getSimpleName();
				eb = false;
				for (k = 1; k <= columnCount; k++) {
					if (fname.equals(metadata.getColumnName(k).toLowerCase())) {
						eb = true;
						break;
					}
				}
				if (eb) {
					try {
						Object objfield;
						if ("Date".equals(ftype)) {
							java.sql.Date d = (java.sql.Date) rs.getDate(fname);
							objfield = new Date(d.getYear(), d.getMonth(), d.getDate());
						} else if ("String".equals(ftype))
							objfield = rs.getString(fname);
						else
							objfield = rs.getObject(fname);
						for (j = 0; j < m.length; j++)
							if (m[j].getName().toLowerCase().equals("set" + fname)) {
								m[j].invoke(objnew, objfield);
								break;
							}
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			return objnew;
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return null;
	}

	public static Object getObject(Object obj, ResultSet rs, String dateFormat) {
		if (obj == null || rs == null)
			return null;
		Class clas = obj.getClass();
		Field[] f = clas.getDeclaredFields();
		Method[] m = clas.getDeclaredMethods();
		ResultSetMetaData metadata;
		int columnCount = 0;
		try {
			metadata = rs.getMetaData();
			columnCount = metadata.getColumnCount();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return null;
		}

		int i = 0;
		int j = 0, k = 0, c = 0;
		boolean eb = false;
		try {
			Object objnew = clas.newInstance();
			for (i = 0; i < f.length; i++) {
				String fname = f[i].getName().toLowerCase();
				String ftype = f[i].getType().getSimpleName();
				eb = false;
				c = -1;
				for (k = 1; k <= columnCount; k++) {
					if (fname.equals(metadata.getColumnName(k).toLowerCase())) {
						c = k;
						eb = true;
						break;
					}
				}
				if (eb) {
					try {
						Object objfield;
						if ("Date".equals(ftype)) {
							java.sql.Date d = (java.sql.Date) rs.getDate(fname);
							objfield = new Date(d.getYear(), d.getMonth(), d.getDate());
						} else if ("String".equals(ftype)) {

							if (eb) {
								if (metadata.getColumnTypeName(c).toLowerCase().indexOf("date") != 0)
									eb = false;
							}
							if (eb) {
								java.sql.Date d = (java.sql.Date) rs.getDate(fname);
								Date date = new Date(d.getYear(), d.getMonth(), d.getDate());
								objfield = convertDateToString(date, dateFormat);
							} else
								objfield = rs.getString(fname);
						} else
							objfield = rs.getObject(fname);
						for (j = 0; j < m.length; j++)
							if (m[j].getName().toLowerCase().equals("set" + fname)) {
								m[j].invoke(objnew, objfield);
								break;
							}
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			return objnew;
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getSQLInsertFromObject(Object obj, String sAutoIncreament) {
		if (obj == null)
			return "";
		int i = 0;
		String sauto = sAutoIncreament.trim().toLowerCase();
		StringBuilder sb = new StringBuilder("insert into ");
		Class clas = obj.getClass();
		Field[] f = clas.getDeclaredFields();
		Method[] m = clas.getDeclaredMethods();
		String tablename = clas.getSimpleName();
		sb.append(tablename);
		sb.append('(');
		int c = 0;
		for (i = 0; i < f.length; i++) {
			if (!f[i].getName().toLowerCase().equals(sauto)) {
				if (c == 0) {
					sb.append(f[i].getName());
					c++;
				} else
					sb.append(',' + f[i].getName());
			}

		}
		sb.append(") values(");
		c = 0;
		for (i = 0; i < f.length; i++) {
			String fname = f[i].getName();
			String ftype = f[i].getType().getSimpleName();
			String fnamelower = fname.toLowerCase();
			if (!fnamelower.equals(sauto)) {
				if ("Date".equals(ftype)) {
					Date d = null;
					for (int j = 0; j < m.length; j++)
						if (m[j].getName().toLowerCase().equals("get" + fnamelower)) {
							try {
								d = (Date) m[j].invoke(obj);
							} catch (IllegalAccessException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IllegalArgumentException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							break;
						}
					if (c > 0)
						sb.append(',');
					if (d == null) {
						sb.append("''");
					} else {
						sb.append("'" + convertDateToString(d, "MM-dd-yyyy") + "'");
					}

				} else if ("String".equals(ftype)) {
					String temps = "";
					for (int j = 0; j < m.length; j++)
						if (m[j].getName().toLowerCase().equals("get" + fnamelower)) {
							try {
								temps = (String) m[j].invoke(obj);
							} catch (IllegalAccessException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IllegalArgumentException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							break;
						}
					if (c > 0)
						sb.append(',');
					sb.append("N'" + temps + "'");
				} else {

					Object value = null;
					for (int j = 0; j < m.length; j++)
						if (m[j].getName().toLowerCase().equals("get" + fnamelower)) {
							try {
								value = m[j].invoke(obj);
							} catch (IllegalAccessException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IllegalArgumentException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							break;
						}
					if (c > 0)
						sb.append(',');
					if (value == null)
						sb.append("");
					else
						sb.append(value.toString());
				}
				c++;
			}
		}
		sb.append(')');
		return sb.toString();

	}

	public static String getSQLUpdateFromObject(Object obj, String[] keys) {
		if (obj == null || keys == null || keys.length <= 0)
			return "";
		int i = 0, j = 0;
		StringBuilder sb = new StringBuilder("update ");
		StringBuilder sbwhere = new StringBuilder();
		Class clas = obj.getClass();
		Field[] f = clas.getDeclaredFields();
		Method[] m = clas.getDeclaredMethods();
		String tablename = clas.getSimpleName();
		sb.append(tablename + " set ");
		int c = 0, count = 0;
		boolean eb = true;
		for (i = 0; i < f.length; i++) {
			eb = true;
			String fnamelower = f[i].getName().toLowerCase();
			for (j = 0; j < keys.length; j++) {
				if (fnamelower.equals(keys[j].toLowerCase())) {
					String ftype = f[i].getType().getSimpleName();
					if ("Date".equals(ftype)) {
						Date d = null;
						for (j = 0; j < m.length; j++)
							if (m[j].getName().toLowerCase().equals("get" + fnamelower)) {
								try {
									d = (Date) m[j].invoke(obj);
								} catch (IllegalAccessException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IllegalArgumentException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (InvocationTargetException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								break;
							}
						if (count > 0)
							sbwhere.append(" and ");
						if (d == null) {
							sbwhere.append(fnamelower + "=''");
						} else {
							sbwhere.append(fnamelower + "='" + convertDateToString(d, "MM-dd-yyyy") + "'");
						}
					} else if ("String".equals(ftype)) {
						String temps = "";
						for (j = 0; j < m.length; j++)
							if (m[j].getName().toLowerCase().equals("get" + fnamelower)) {
								try {
									temps = (String) m[j].invoke(obj);
								} catch (IllegalAccessException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IllegalArgumentException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (InvocationTargetException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								break;
							}
						if (count > 0)
							sbwhere.append(" and ");
						sbwhere.append(fnamelower + "=N'" + temps + "'");
					} else {
						Object value = null;
						for (j = 0; j < m.length; j++)
							if (m[j].getName().toLowerCase().equals("get" + fnamelower)) {
								try {
									value = m[j].invoke(obj);
								} catch (IllegalAccessException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IllegalArgumentException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (InvocationTargetException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								break;
							}
						if (count > 0)
							sbwhere.append(" and ");
						if (value != null)
							sbwhere.append(fnamelower + "=" + value.toString());
					}
					count++;
					eb = false;
					break;
				}
			}
			if (eb) {
				String ftype = f[i].getType().getSimpleName();
				if ("Date".equals(ftype)) {
					Date d = null;
					for (j = 0; j < m.length; j++)
						if (m[j].getName().toLowerCase().equals("get" + fnamelower)) {
							try {
								d = (Date) m[j].invoke(obj);
							} catch (IllegalAccessException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IllegalArgumentException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							break;
						}
					if (c > 0)
						sb.append(',');
					if (d == null) {
						sb.append(fnamelower + "=''");
					} else {
						sb.append(fnamelower + "='" + convertDateToString(d, "MM-dd-yyyy") + "'");
					}
				} else if ("String".equals(ftype)) {
					String temps = "";
					for (j = 0; j < m.length; j++)
						if (m[j].getName().toLowerCase().equals("get" + fnamelower)) {
							try {
								temps = (String) m[j].invoke(obj);
							} catch (IllegalAccessException e) {
								e.printStackTrace();
							} catch (IllegalArgumentException e) {
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								e.printStackTrace();
							}
							break;
						}
					if (c > 0)
						sb.append(',');
					sb.append(fnamelower + "=N'" + temps + "'");
				} else {
					Object value = null;
					for (j = 0; j < m.length; j++)
						if (m[j].getName().toLowerCase().equals("get" + fnamelower)) {
							try {
								value = m[j].invoke(obj);
							} catch (IllegalAccessException e) {
								e.printStackTrace();
							} catch (IllegalArgumentException e) {
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								e.printStackTrace();
							}
							break;
						}
					if (c > 0)
						sb.append(',');
					if (value != null)
						sb.append(fnamelower + "=" + value.toString());
				}
				c++;
			}

		}
		if (count == keys.length) {
			sb.append(" where ");
			sb.append(sbwhere);
		} else
			return "";
		return sb.toString();
	}

	public static String convertDateToString(Date date, String format) {
		String dateStr = null;
		DateFormat df = new SimpleDateFormat(format);
		if (date == null)
			return "";
		try {
			dateStr = df.format(date);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return dateStr;
	}
}
