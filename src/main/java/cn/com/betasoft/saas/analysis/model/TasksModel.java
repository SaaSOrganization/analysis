package cn.com.betasoft.saas.analysis.model;

import java.sql.Date;

/**
 * created by lichenzhe on 2018/1/2
 */
public class TasksModel {
    //    SELECT * FROM batch_job_instance  bji JOIN batch_job_execution bje where bji.JOB_INSTANCE_ID=bje.JOB_INSTANCE_ID
    public int job_instance_id;
    public String job_name;
    //    public int version;
    public int job_execution_id;
    public Date create_time;
    public Date start_time;
    public Date end_time;
    public String status;
    public String exit_code;
    public String exit_message;
//    public String last_updated;
//    public String job_configuration_location;
//    public String job_key;


    public int getJob_instance_id() {
        return job_instance_id;
    }

    public void setJob_instance_id(int job_instance_id) {
        this.job_instance_id = job_instance_id;
    }

    public String getJob_name() {
        return job_name;
    }

    public void setJob_name(String job_name) {
        this.job_name = job_name;
    }

    public int getJob_execution_id() {
        return job_execution_id;
    }

    public void setJob_execution_id(int job_execution_id) {
        this.job_execution_id = job_execution_id;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getExit_code() {
        return exit_code;
    }

    public void setExit_code(String exit_code) {
        this.exit_code = exit_code;
    }

    public String getExit_message() {
        return exit_message;
    }

    public void setExit_message(String exit_message) {
        this.exit_message = exit_message;
    }
}
