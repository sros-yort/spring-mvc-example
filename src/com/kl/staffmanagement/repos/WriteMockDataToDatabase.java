package com.kl.staffmanagement.repos;

import com.kl.staffmanagement.model.User;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;

@Service
public class WriteMockDataToDatabase {

    @Autowired
    private UserRepos userRepos;

    private static String jsonData = "{" +
            "  \"data\": [" +
            "   {\"seq\":20,\"data1\":\"ahope20\",\"data2\":\"KIM20\",\"data3\":\"user20\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 01\"}," +
            "   {\"seq\":19,\"data1\":\"ahope21\",\"data2\":\"KIM21\",\"data3\":\"user21\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 02\"}," +
            "   {\"seq\":18,\"data1\":\"ahope22\",\"data2\":\"KIM22\",\"data3\":\"user22\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 03\"}," +
            "   {\"seq\":17,\"data1\":\"ahope23\",\"data2\":\"KIM23\",\"data3\":\"user23\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 04\"}," +
            "   {\"seq\":16,\"data1\":\"ahope24\",\"data2\":\"KIM24\",\"data3\":\"user24\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 05\"}," +
            "   {\"seq\":15,\"data1\":\"ahope25\",\"data2\":\"KIM25\",\"data3\":\"user25\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 06\"}," +
            "   {\"seq\":14,\"data1\":\"ahope26\",\"data2\":\"KIM26\",\"data3\":\"user26\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 07\"}," +
            "   {\"seq\":13,\"data1\":\"ahope27\",\"data2\":\"KIM27\",\"data3\":\"user27\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 08\"}," +
            "   {\"seq\":12,\"data1\":\"ahope28\",\"data2\":\"KIM28\",\"data3\":\"user28\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 09\"}," +
            "   {\"seq\":11,\"data1\":\"ahope29\",\"data2\":\"KIM29\",\"data3\":\"user29\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 10\"}," +
            "   {\"seq\":10,\"data1\":\"ahope30\",\"data2\":\"KIM30\",\"data3\":\"user30\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 11\"}," +
            "   {\"seq\":9,\"data1\":\"ahope31\",\"data2\":\"KIM31\",\"data3\":\"user31\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 12\"}," +
            "   {\"seq\":8,\"data1\":\"ahope32\",\"data2\":\"KIM32\",\"data3\":\"user32\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 13\"}," +
            "   {\"seq\":7,\"data1\":\"ahope33\",\"data2\":\"KIM33\",\"data3\":\"user33\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 14\"}," +
            "   {\"seq\":6,\"data1\":\"ahope34\",\"data2\":\"KIM34\",\"data3\":\"user34\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 15\"}," +
            "   {\"seq\":5,\"data1\":\"ahope35\",\"data2\":\"KIM35\",\"data3\":\"user35\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 16\"}," +
            "   {\"seq\":4,\"data1\":\"ahope36\",\"data2\":\"KIM36\",\"data3\":\"user36\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 17\"}," +
            "   {\"seq\":3,\"data1\":\"ahope37\",\"data2\":\"KIM37\",\"data3\":\"user37\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 18\"}," +
            "   {\"seq\":2,\"data1\":\"ahope38\",\"data2\":\"KIM38\",\"data3\":\"user38\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 19\"}," +
            "   {\"seq\":1,\"data1\":\"ahope39\",\"data2\":\"KIM39\",\"data3\":\"user39\",\"data4\":\"ahope@ahope.co.kr\",\"data5\":\"2018. 03. 20\"}" +
            " ]" +
            "  }";

    public void addUser() {
        try {
            JSONArray jsonArray = new JSONObject(jsonData).getJSONArray("data");
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                userRepos.create(new User(
                        jsonObject.getString("data1") + " " + jsonObject.getString("data2"),
                        "123456",
                        jsonObject.getString("data3"),
                        jsonObject.getString("data4"),
                        new Date(12345654L),
                        false
                ));
            }

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
}
