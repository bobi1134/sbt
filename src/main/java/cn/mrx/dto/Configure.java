package cn.mrx.dto;

public class Configure {
    private Integer id;

    private String linkname;

    private String linkurl;

    private String copyright;

    private Integer advanceorder;

    private Integer type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLinkname() {
        return linkname;
    }

    public void setLinkname(String linkname) {
        this.linkname = linkname == null ? null : linkname.trim();
    }

    public String getLinkurl() {
        return linkurl;
    }

    public void setLinkurl(String linkurl) {
        this.linkurl = linkurl == null ? null : linkurl.trim();
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright == null ? null : copyright.trim();
    }

    public Integer getAdvanceorder() {
        return advanceorder;
    }

    public void setAdvanceorder(Integer advanceorder) {
        this.advanceorder = advanceorder;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}