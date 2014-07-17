mongoose = module.parent.exports.mongoose

schema = new Schema
  name: {type: String, default: "default"}
  sex: {type: String, default: "f"}
  age: {type: Number, default: 0}
  email: {type: String, default: ""}
  telephone: {type: Number, default: 0}

module.exports = User = mongoose.model("User", schema, "user")
