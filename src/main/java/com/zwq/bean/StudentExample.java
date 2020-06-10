package com.zwq.bean;

import java.util.ArrayList;
import java.util.List;

public class StudentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StudentExample() {
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

        public Criteria andStuIdIsNull() {
            addCriterion("stu_id is null");
            return (Criteria) this;
        }

        public Criteria andStuIdIsNotNull() {
            addCriterion("stu_id is not null");
            return (Criteria) this;
        }

        public Criteria andStuIdEqualTo(String value) {
            addCriterion("stu_id =", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdNotEqualTo(String value) {
            addCriterion("stu_id <>", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdGreaterThan(String value) {
            addCriterion("stu_id >", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdGreaterThanOrEqualTo(String value) {
            addCriterion("stu_id >=", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdLessThan(String value) {
            addCriterion("stu_id <", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdLessThanOrEqualTo(String value) {
            addCriterion("stu_id <=", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdLike(String value) {
            addCriterion("stu_id like", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdNotLike(String value) {
            addCriterion("stu_id not like", value, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdIn(List<String> values) {
            addCriterion("stu_id in", values, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdNotIn(List<String> values) {
            addCriterion("stu_id not in", values, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdBetween(String value1, String value2) {
            addCriterion("stu_id between", value1, value2, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuIdNotBetween(String value1, String value2) {
            addCriterion("stu_id not between", value1, value2, "stuId");
            return (Criteria) this;
        }

        public Criteria andStuPasswordIsNull() {
            addCriterion("stu_password is null");
            return (Criteria) this;
        }

        public Criteria andStuPasswordIsNotNull() {
            addCriterion("stu_password is not null");
            return (Criteria) this;
        }

        public Criteria andStuPasswordEqualTo(String value) {
            addCriterion("stu_password =", value, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordNotEqualTo(String value) {
            addCriterion("stu_password <>", value, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordGreaterThan(String value) {
            addCriterion("stu_password >", value, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("stu_password >=", value, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordLessThan(String value) {
            addCriterion("stu_password <", value, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordLessThanOrEqualTo(String value) {
            addCriterion("stu_password <=", value, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordLike(String value) {
            addCriterion("stu_password like", value, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordNotLike(String value) {
            addCriterion("stu_password not like", value, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordIn(List<String> values) {
            addCriterion("stu_password in", values, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordNotIn(List<String> values) {
            addCriterion("stu_password not in", values, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordBetween(String value1, String value2) {
            addCriterion("stu_password between", value1, value2, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuPasswordNotBetween(String value1, String value2) {
            addCriterion("stu_password not between", value1, value2, "stuPassword");
            return (Criteria) this;
        }

        public Criteria andStuNameIsNull() {
            addCriterion("stu_name is null");
            return (Criteria) this;
        }

        public Criteria andStuNameIsNotNull() {
            addCriterion("stu_name is not null");
            return (Criteria) this;
        }

        public Criteria andStuNameEqualTo(String value) {
            addCriterion("stu_name =", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameNotEqualTo(String value) {
            addCriterion("stu_name <>", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameGreaterThan(String value) {
            addCriterion("stu_name >", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameGreaterThanOrEqualTo(String value) {
            addCriterion("stu_name >=", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameLessThan(String value) {
            addCriterion("stu_name <", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameLessThanOrEqualTo(String value) {
            addCriterion("stu_name <=", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameLike(String value) {
            addCriterion("stu_name like", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameNotLike(String value) {
            addCriterion("stu_name not like", value, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameIn(List<String> values) {
            addCriterion("stu_name in", values, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameNotIn(List<String> values) {
            addCriterion("stu_name not in", values, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameBetween(String value1, String value2) {
            addCriterion("stu_name between", value1, value2, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuNameNotBetween(String value1, String value2) {
            addCriterion("stu_name not between", value1, value2, "stuName");
            return (Criteria) this;
        }

        public Criteria andStuClassIdIsNull() {
            addCriterion("stu_class_id is null");
            return (Criteria) this;
        }

        public Criteria andStuClassIdIsNotNull() {
            addCriterion("stu_class_id is not null");
            return (Criteria) this;
        }

        public Criteria andStuClassIdEqualTo(Integer value) {
            addCriterion("stu_class_id =", value, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuClassIdNotEqualTo(Integer value) {
            addCriterion("stu_class_id <>", value, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuClassIdGreaterThan(Integer value) {
            addCriterion("stu_class_id >", value, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuClassIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("stu_class_id >=", value, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuClassIdLessThan(Integer value) {
            addCriterion("stu_class_id <", value, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuClassIdLessThanOrEqualTo(Integer value) {
            addCriterion("stu_class_id <=", value, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuClassIdIn(List<Integer> values) {
            addCriterion("stu_class_id in", values, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuClassIdNotIn(List<Integer> values) {
            addCriterion("stu_class_id not in", values, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuClassIdBetween(Integer value1, Integer value2) {
            addCriterion("stu_class_id between", value1, value2, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuClassIdNotBetween(Integer value1, Integer value2) {
            addCriterion("stu_class_id not between", value1, value2, "stuClassId");
            return (Criteria) this;
        }

        public Criteria andStuRankIsNull() {
            addCriterion("stu_rank is null");
            return (Criteria) this;
        }

        public Criteria andStuRankIsNotNull() {
            addCriterion("stu_rank is not null");
            return (Criteria) this;
        }

        public Criteria andStuRankEqualTo(Integer value) {
            addCriterion("stu_rank =", value, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuRankNotEqualTo(Integer value) {
            addCriterion("stu_rank <>", value, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuRankGreaterThan(Integer value) {
            addCriterion("stu_rank >", value, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuRankGreaterThanOrEqualTo(Integer value) {
            addCriterion("stu_rank >=", value, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuRankLessThan(Integer value) {
            addCriterion("stu_rank <", value, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuRankLessThanOrEqualTo(Integer value) {
            addCriterion("stu_rank <=", value, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuRankIn(List<Integer> values) {
            addCriterion("stu_rank in", values, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuRankNotIn(List<Integer> values) {
            addCriterion("stu_rank not in", values, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuRankBetween(Integer value1, Integer value2) {
            addCriterion("stu_rank between", value1, value2, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuRankNotBetween(Integer value1, Integer value2) {
            addCriterion("stu_rank not between", value1, value2, "stuRank");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentIsNull() {
            addCriterion("\"stu_ punishment\" is null");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentIsNotNull() {
            addCriterion("\"stu_ punishment\" is not null");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentEqualTo(Boolean value) {
            addCriterion("\"stu_ punishment\" =", value, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentNotEqualTo(Boolean value) {
            addCriterion("\"stu_ punishment\" <>", value, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentGreaterThan(Boolean value) {
            addCriterion("\"stu_ punishment\" >", value, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentGreaterThanOrEqualTo(Boolean value) {
            addCriterion("\"stu_ punishment\" >=", value, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentLessThan(Boolean value) {
            addCriterion("\"stu_ punishment\" <", value, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentLessThanOrEqualTo(Boolean value) {
            addCriterion("\"stu_ punishment\" <=", value, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentIn(List<Boolean> values) {
            addCriterion("\"stu_ punishment\" in", values, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentNotIn(List<Boolean> values) {
            addCriterion("\"stu_ punishment\" not in", values, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentBetween(Boolean value1, Boolean value2) {
            addCriterion("\"stu_ punishment\" between", value1, value2, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuPunishmentNotBetween(Boolean value1, Boolean value2) {
            addCriterion("\"stu_ punishment\" not between", value1, value2, "stuPunishment");
            return (Criteria) this;
        }

        public Criteria andStuGradIsNull() {
            addCriterion("stu_grad is null");
            return (Criteria) this;
        }

        public Criteria andStuGradIsNotNull() {
            addCriterion("stu_grad is not null");
            return (Criteria) this;
        }

        public Criteria andStuGradEqualTo(Boolean value) {
            addCriterion("stu_grad =", value, "stuGrad");
            return (Criteria) this;
        }

        public Criteria andStuGradNotEqualTo(Boolean value) {
            addCriterion("stu_grad <>", value, "stuGrad");
            return (Criteria) this;
        }

        public Criteria andStuGradGreaterThan(Boolean value) {
            addCriterion("stu_grad >", value, "stuGrad");
            return (Criteria) this;
        }

        public Criteria andStuGradGreaterThanOrEqualTo(Boolean value) {
            addCriterion("stu_grad >=", value, "stuGrad");
            return (Criteria) this;
        }

        public Criteria andStuGradLessThan(Boolean value) {
            addCriterion("stu_grad <", value, "stuGrad");
            return (Criteria) this;
        }

        public Criteria andStuGradLessThanOrEqualTo(Boolean value) {
            addCriterion("stu_grad <=", value, "stuGrad");
            return (Criteria) this;
        }

        public Criteria andStuGradIn(List<Boolean> values) {
            addCriterion("stu_grad in", values, "stuGrad");
            return (Criteria) this;
        }

        public Criteria andStuGradNotIn(List<Boolean> values) {
            addCriterion("stu_grad not in", values, "stuGrad");
            return (Criteria) this;
        }

        public Criteria andStuGradBetween(Boolean value1, Boolean value2) {
            addCriterion("stu_grad between", value1, value2, "stuGrad");
            return (Criteria) this;
        }

        public Criteria andStuGradNotBetween(Boolean value1, Boolean value2) {
            addCriterion("stu_grad not between", value1, value2, "stuGrad");
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