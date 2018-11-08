package com.lx.p2p.console.entity;

import java.util.Date;

public class Project {
    private Integer projectId;

    private String title;

    private Double borrowingAmount;

    private Float yearRate;

    private Integer loanLife;

    private String returnType;

    private Integer loanSchedule;

    private String status;

    private Integer userId;

    private String investmentType;

    private Integer riskId;

    private Integer loanApplicationManagementId;

    private Date releaseDate;

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Double getBorrowingAmount() {
        return borrowingAmount;
    }

    public void setBorrowingAmount(Double borrowingAmount) {
        this.borrowingAmount = borrowingAmount;
    }

    public Float getYearRate() {
        return yearRate;
    }

    public void setYearRate(Float yearRate) {
        this.yearRate = yearRate;
    }

    public Integer getLoanLife() {
        return loanLife;
    }

    public void setLoanLife(Integer loanLife) {
        this.loanLife = loanLife;
    }

    public String getReturnType() {
        return returnType;
    }

    public void setReturnType(String returnType) {
        this.returnType = returnType == null ? null : returnType.trim();
    }

    public Integer getLoanSchedule() {
        return loanSchedule;
    }

    public void setLoanSchedule(Integer loanSchedule) {
        this.loanSchedule = loanSchedule;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getInvestmentType() {
        return investmentType;
    }

    public void setInvestmentType(String investmentType) {
        this.investmentType = investmentType == null ? null : investmentType.trim();
    }

    public Integer getRiskId() {
        return riskId;
    }

    public void setRiskId(Integer riskId) {
        this.riskId = riskId;
    }

    public Integer getLoanApplicationManagementId() {
        return loanApplicationManagementId;
    }

    public void setLoanApplicationManagementId(Integer loanApplicationManagementId) {
        this.loanApplicationManagementId = loanApplicationManagementId;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }
}