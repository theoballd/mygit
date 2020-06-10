package com.zwq.bean;

import java.util.ArrayList;
import java.util.List;

public class AdminExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AdminExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andAdmIdIsNull() {
            addCriterion("adm_id is null");
            return (Criteria) this;
        }

        public Criteria andAdmIdIsNotNull() {
            addCriterion("adm_id is not null");
            return (Criteria) this;
        }

        public Criteria andAdmIdEqualTo(String value) {
            addCriterion("adm_id =", value, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdNotEqualTo(String value) {
            addCriterion("adm_id <>", value, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdGreaterThan(String value) {
            addCriterion("adm_id >", value, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdGreaterThanOrEqualTo(String value) {
            addCriterion("adm_id >=", value, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdLessThan(String value) {
            addCriterion("adm_id <", value, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdLessThanOrEqualTo(String value) {
            addCriterion("adm_id <=", value, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdLike(String value) {
            addCriterion("adm_id like", value, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdNotLike(String value) {
            addCriterion("adm_id not like", value, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdIn(List<String> values) {
            addCriterion("adm_id in", values, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdNotIn(List<String> values) {
            addCriterion("adm_id not in", values, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdBetween(String value1, String value2) {
            addCriterion("adm_id between", value1, value2, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmIdNotBetween(String value1, String value2) {
            addCriterion("adm_id not between", value1, value2, "admId");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordIsNull() {
            addCriterion("adm_password is null");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordIsNotNull() {
            addCriterion("adm_password is not null");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordEqualTo(String value) {
            addCriterion("adm_password =", value, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordNotEqualTo(String value) {
            addCriterion("adm_password <>", value, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordGreaterThan(String value) {
            addCriterion("adm_password >", value, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("adm_password >=", value, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordLessThan(String value) {
            addCriterion("adm_password <", value, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordLessThanOrEqualTo(String value) {
            addCriterion("adm_password <=", value, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordLike(String value) {
            addCriterion("adm_password like", value, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordNotLike(String value) {
            addCriterion("adm_password not like", value, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordIn(List<String> values) {
            addCriterion("adm_password in", values, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordNotIn(List<String> values) {
            addCriterion("adm_password not in", values, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordBetween(String value1, String value2) {
            addCriterion("adm_password between", value1, value2, "admPassword");
            return (Criteria) this;
        }

        public Criteria andAdmPasswordNotBetween(String value1, String value2) {
            addCriterion("adm_password not between", value1, value2, "admPassword");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}