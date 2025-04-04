const mongoose=require("mongoose");

const UserSchema=new mongoose.Schema({
    email:{type:String ,unique :true},
    password:String,
    userId:{type:string ,unique:true},
    resetToken:String,
    resetTokenExpiry:Date,
})

const users=mongoose.model("users",UserSchema);
module.exports=users