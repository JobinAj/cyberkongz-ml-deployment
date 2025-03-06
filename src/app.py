from fastapi import FastAPI
from transformers import AutoModel, AutoTokenizer
import torch

app = FastAPI()

MODEL_NAME = "huggingnft/cyberkongz"
model = AutoModel.from_pretrained(MODEL_NAME)
tokenizer = AutoTokenizer.from_pretrained(MODEL_NAME)

@app.get("/")
def read_root():
    return {"message": "CyberKongz Model API is Running!"}

@app.post("/predict/")
def predict(text: str):
    inputs = tokenizer(text, return_tensors="pt")
    outputs = model(**inputs)
    return {"output": outputs.last_hidden_state.tolist()}
