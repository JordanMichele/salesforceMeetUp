public class JSON2APEX {
    public class Status {
        public String type;
        public String message;
        public Integer code;
        public String code_message;
    }

    public class Requests {
        public Request request;
    }

    public Response response;

    public class Response {
        public Integer count;
        public Double benchmark;
        public List<Requests> requests;
        public Status status;
    }

    public class Request {
        public Integer id;
        public String image_thumbnail;
        public String title;
        public String description;
        public String status;
        public String address;
        public String location;
        public String zipcode;
        public String user;
        public Integer date_created;
        public Integer count_comments;
        public Integer count_followers;
        public Integer count_supporters;
        public Double lat;
        public Double lon;
        public Integer user_follows;
        public Integer user_comments;
        public Integer user_request;
        public String rank;
    }


    public static JSON2APEX parse(String json) {
        return (JSON2APEX) System.JSON.deserialize(json, JSON2APEX.class);
    }

    
}