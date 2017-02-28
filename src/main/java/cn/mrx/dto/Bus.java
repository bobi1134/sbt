package cn.mrx.dto;

import java.util.Date;

public class Bus {
    private Integer id;

    private Date time;

    private String start;

    private String end;

    private String type;

    private String runtime;

    private Double price;

    private Integer surplus;

    private Integer date;
    
    //DES加密的id串
    private String ids;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start == null ? null : start.trim();
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end == null ? null : end.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getRuntime() {
        return runtime;
    }

    public void setRuntime(String runtime) {
        this.runtime = runtime == null ? null : runtime.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getSurplus() {
        return surplus;
    }

    public void setSurplus(Integer surplus) {
        this.surplus = surplus;
    }

    public Integer getDate() {
        return date;
    }

    public void setDate(Integer date) {
        this.date = date;
    }

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}