package DataClass;

// 차량 관련  DTO	
public class CarData {
	public String TYPE;
	public String MODEL;
	public int MAX_YEAR;
	public int MIN_YEAR;
	public int MAX_PRICE;
	public int MIN_PRICE;
	public int MAX_MILEAGE;
	public int MIN_MILEAGE;
	public String MAKE;
	public String URL;

	public int YEAR;
	public int PRICE;
	public int MILEAGE;

	public String getTYPE() {
		return TYPE;
	}

	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}

	public String getMODEL() {
		return MODEL;
	}

	public void setMODEL(String mODEL) {
		MODEL = mODEL;
	}

	public String getMAKE() {
		return MAKE;
	}

	public void setMAKE(String mAKE) {
		MAKE = mAKE;
	}

	public String getURL() {
		return URL;
	}

	public void setURL(String uRL) {
		URL = uRL;
	}

	public int getYEAR() {
		return YEAR;
	}

	public void setYEAR(int yEAR) {
		YEAR = yEAR;
	}

	public int getPRICE() {
		return PRICE;
	}

	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}

	public int getMILEAGE() {
		return MILEAGE;
	}

	public void setMILEAGE(int mILEAGE) {
		MILEAGE = mILEAGE;
	}

	public String CAR_ID;
	public String ACCIDENT;
	public String FUELTYPE;
	public String MPG;

	public String getCAR_ID() {
		return CAR_ID;
	}

	public void setCAR_ID(String cAR_ID) {
		CAR_ID = cAR_ID;
	}

	public String getACCIDENT() {
		return ACCIDENT;
	}

	public void setACCIDENT(String aCCIDENT) {
		ACCIDENT = aCCIDENT;
	}

	public String getFUELTYPE() {
		return FUELTYPE;
	}

	public void setFUELTYPE(String fUELTYPE) {
		FUELTYPE = fUELTYPE;
	}

	public String getMPG() {
		return MPG;
	}

	public void setMPG(String mPG) {
		MPG = mPG;
	}
}
