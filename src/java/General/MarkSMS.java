/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

import Actor.Student;
import Mark.Mark;
import Subjects.Subjects;
import com.action.Find;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Home
 */
public class MarkSMS {

    public static String getContent(String rollno, String sem, String exam) throws SQLException {
        String marks = "";
        String pass;
        String name;
        String status;
        String content = "";
        int i = 0;
        Subjects s = new Subjects();
        s.setSem(sem);
        String batch = Student.getById(rollno).getBatch();
        s.setAyear(Find.getAcyear(batch, sem));
        s.setRegulation(Batch.getRegulation(batch));
        List<String> list = Subjects.getTherorySubCode(Find.sdept(rollno), s);
        int fail = 0;
        for (String p : list) {
            Mark m = new Mark();
            m.setRollno(rollno);
            m.setSubcode(p);
            List<Mark> li = Mark.getExamMark(Find.sdept(rollno), m);
            int flag = 0;
            int total = 0, gtotal = 0;
            String marku1 = null, marku2 = null, zmarku1 = null, zmarku2 = null;
            String markm3 = null, zmarkm3 = null;
            switch (Integer.parseInt(exam)) {
                case 1:
                    if (li.size() != 0) {

                        for (Mark mi : li) {
                            if (mi.getType().equals("unit1")) {
                                marku1 = mi.getMark();
                            } else if (mi.getType().equals("unit2")) {
                                marku2 = mi.getMark();
                            }
                        }
                        if (marku1 != null && !marku1.equals("A") && !marku1.equals("N")) {
                            total += Integer.parseInt(marku1);
                        }
                        if (marku2 != null && !marku2.equals("A") && !marku2.equals("N")) {
                            total += Integer.parseInt(marku2);
                        }
                            float x = (float) (((float) total / 150.0) * 100.0);
                            gtotal = (int) (Math.round(x));
                        if (marku1.equals("A") && marku2.equals("A")) {
                            flag = 1;
                        }
                    }
                    break;
                case 2:
                    if (li.size() != 0) {
                        for (Mark mi : li) {
                            if (mi.getType().equals("unit3")) {
                                marku1 = mi.getMark();
                            } else if (mi.getType().equals("unit4")) {
                                marku2 = mi.getMark();
                            }
                        }
                        if (marku1 != null && !marku1.equals("A") && !marku1.equals("N")) {
                            total += Integer.parseInt(marku1);
                        }
                        if (marku2 != null && !marku2.equals("A") && !marku2.equals("N")) {
                            total += Integer.parseInt(marku2);
                         }
                           float x = (float) (((float) total / 150.0) * 100.0);
                           gtotal = (int) (Math.round(x));
                        
                        if (marku1.equals("A") && marku2.equals("A")) {
                            flag = 1;
                        }
                    }
                    break;
                case 3:
                    if (li.size() != 0) {
                        for (Mark mi : li) {
                            if (mi.getType().equals("model3")) {
                                markm3 = mi.getMark();
                            }
                        }
                        if (markm3 != null && !markm3.equals("A") && !markm3.equals("N")) {
                            total += Integer.parseInt(markm3);
                        }
                        if (markm3.equals("A")) {
                            flag = 1;
                        }
                        gtotal += total;
                    }
                    break;
            }

            i++;
            int mark;
            String subcode = p.toUpperCase();
            subcode = "Sub" + i + "(" + subcode + ")";

            if (flag==1) {
                marks += subcode + ":" + "A" + ", ";
            } else {
                marks += subcode + ":" + gtotal + ", ";
            }
            name = Student.getById(rollno).getName();
            if(gtotal<45){
                fail++;
            }
                       
            if (fail == 0) {
                pass = "PASSED";
                status = "happy";
            } else {
                pass = "FAILED in " + fail + " Subjects";
                if (fail == 1) {
                    pass = pass.substring(0, pass.length() - 1);
                }
                status = "sorry";
            }
            content = "Dear Parents, "
                    + "We are " + status + " to inform you that your ward " + name + " (" + rollno + ") has " + pass + " in the Assessment-" + exam + " Examination,Securing the following Marks " + marks.substring(0, marks.length() - 2) + ".Refer Portal for further details";
        }
        return content;
    }
}
