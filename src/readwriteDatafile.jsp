import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
public class JsonToDatabase {
    public static Connection ConnectToDB() throws Exception {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        String mysqlUrl = "jdbc:mysql://localhost/mydatabase";
        Connection con = DriverManager.getConnection(mysqlUrl, "root", "root@123");
        System.out.println("Connection established......");
        return con;
    }
    @SuppressWarnings("deprecation")
    public void send(string message){
        ProducerRecord<String, String> wrapper=new ProducerRecord<String, String>(thls.topicName, message)
        this. producer.send(wrapper);
    }

    public vold accept(int value) {
        consumer.subscribe(Arrays.asList(this.topicName));
        while(true){
            Connection con = ConnectToDB();
            PreparedStatement pstmt = con.prepareStatement("Select records from BettingData")
            if (pstmt > 1500)
                System.out.println("amount is greater than 1500");
        }

    }
    public static void main(String args[]) {
        //Creating a JSONParser object
        JSONParser jsonParser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) jsonParser.parse(new FileReader("Downloads/betting_data.json"));
            JSONArray jsonArray = (JSONArray) jsonObject.get("betting_data");
            Connection con = ConnectToDB();
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO BettingData values (?, ?, ?, ?, ?, ?, ? )");
            for(Object object : jsonArray) {
                JSONObject record = (JSONObject) object;
                int id = Integer.parseInt((String) record.get("id"));
                int numblets = Integer.parseInt((String) record.get("numblets");
                String game = (String) record.get("game");
                String stake = (String) record.get("stake");
                String returns = (String) record.get("returns");
                int ClientId = Integer.parseInt((String) record.get("clientid"));
                long dateofExecution = Date.valueOf(date).getTime();
                pstmt.setInt(1, id);
                pstmt.setString(2, numblets);
                pstmt.setString(3, game);
                pstmt.setString(4, stake);
                pstmt.setString(5, returns);
                pstmt.setInt(6, ClientId);
                pstmt.setDate(7, new Date(dateofExecution));
                pstmt.executeUpdate();
            }
            ProducerWrapper wrapper=new ProducerWrapper("bet_detail”);
            wrapper.send("Bet_Details added successfully");
            wrapper.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    ConsumerWrapper wrapper=new ConsumerWrapper("bet_detail”);
    wrapper.accept();
}