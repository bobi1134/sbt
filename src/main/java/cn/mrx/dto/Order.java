package cn.mrx.dto;

import java.util.Date;

public class Order {
    private Integer id;

    private Integer userid;

    private Integer busid;

    private String riderid;
    
    private double money;
    
    private Date datetime;
    
    private int ispay;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getBusid() {
        return busid;
    }

    public void setBusid(Integer busid) {
        this.busid = busid;
    }

	public String getRiderid() {
		return riderid;
	}

	public void setRiderid(String riderid) {
		this.riderid = riderid;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public Date getDatetime() {
		return datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public int getIspay() {
		return ispay;
	}

	public void setIspay(int ispay) {
		this.ispay = ispay;
	}

}