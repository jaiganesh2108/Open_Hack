const mongoose=require("mongoose");

const UserSchema=new mongoose.Schema({
    userName:{type:String , unique:true},
    email:{type:String ,unique :true},
    password:String,
    userId:{type:String ,unique:true},
    resetToken:String,
    resetTokenExpiry:Date,
})

const users=mongoose.model("users",UserSchema);
module.exports=users