const mydemosrv = function(srv){
    srv.on('myfunction', (req, res) => {
        return "Hello" + req.data.msg;
    });
}
module.exports=mydemosrv;
// module.exports = (say)=>{
//     say.on ('hello', req => `Hello ${req.data.to}!`)
//   }