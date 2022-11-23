//------------09-11-2021------------------------
update fee_management.invoice i set i.academic_year_id = 
(SELECT a.id FROM fee_management.academic_year a where a.is_running=1);

//------------17-11-2021------------------------
update fee_management.pay_discount p set p.discount_type = 1 
where p.dis_code = 'OTP_DIS' or p.dis_code = 'SIB_DIS' 
or p.dis_code = 'STF_DIS' or p.dis_code = 'SPE_DIS' 
or p.dis_code = 'FAJ_DIS';

update fee_management.pay_discount p set p.discount_type = 2 
where p.dis_code = 'COL_DIS' or p.dis_code = 'SPO_DIS' or p.dis_code = 'ZAK_DIS';


//--------------10-12-2021----------------------
update fee_management.pay_discount p set p.payment_id = (
    select s.id from fee_management.stu_payment s 
    where p.student_id = s.student_id 
    and s.academic_year_id = (SELECT a.id FROM fee_management.academic_year a where a.is_running=1)
)

//------------12-12-2021------------------------------
alter table fee_management.student_attendance DROP column attendance_date;






































//---------Raf : No need to run======================
 INSERT INTO fee_management.pay_discount (id,
    active_status,
    created_date,
    creator,
    modified_date,
    modifier,
    dis_code,
    dis_name,
    discount_amount,
    discount_id,
    discount_type,
    payment_id,
    student_id)
 value(279, 1, '2021-12-06 22:45:09', 1, '2021-12-06 22:45:09', 1, 'FAJ_DIS', 'Fee Adjustment', 100, null, 1, 135, 8);

//===========res============
select * from fee_management.installment_details i 
where i.academic_year_id != (SELECT a.id FROM fee_management.academic_year a where a.is_running=1)
and i.student_id = 

=====================
select * from  fee_management.stu_payment p where p.pre_year_due_amount > 0;

select * from fee_management.installment_details insd
where insd.academic_year_id !=(SELECT a.id FROM fee_management.academic_year a where a.is_running=1)