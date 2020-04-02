

class Usuario{
   String nome;
   String email;
   String senha;

   Map<String, dynamic> toMap(usaurio){
      Map<String,dynamic> map = {
        "nome" : this.nome,
        "email" : this.email,
      };

      return map;
   }

}