const Express = require("express");
const pantryRoutes = require("./routes/pantry.js").router;

const port = 3000;

const app = new Express();
app.set("port", port);
app.set("view engine", "ejs");
app.set("views", __dirname + "/views");

app.use(Express.json());
app.use(Express.static(__dirname + "/public"));

app.use(pantryRoutes);
// app.use((req, res) => {
//     res.status(404).render("404");
// });

app.get("/", (req, res) =>{
    res.send("<h1>Hello world!</h1>");
});

app.listen(port, () => console.log(`Servidor web escuchando por: http://localhost:${port}`));
