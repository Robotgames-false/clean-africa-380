const express = require('express');
const cors = require('cors');
const { MongoClient } = require('mongodb');

const app = express();
app.use(cors());

const uri = 'mongodb+srv://elisio:<robotgames>@atlascluster.6ksopmk.mongodb.net/?retryWrites=true&w=majority&appName=AtlasCluster';
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

app.get('/users', async (req, res) => {
    try {
        await client.connect();
        const db = client.db('<seu-dbname>');
        const usersCollection = db.collection('users');
        const users = await usersCollection.find({}).toArray();
        res.status(200).json(users);
    } catch (err) {
        res.status(500).json({ error: err.message });
    } finally {
        await client.close();
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});
