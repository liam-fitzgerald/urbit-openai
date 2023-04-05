// ChatInterface.tsx
import React, { useState, useRef } from "react";
import { unixToDa } from "@urbit/api";
import { formatDa } from "@urbit/aura";
import { useParams } from "react-router-dom";
import useStore, { useThread } from "../state/store";

interface Message {
  sender: string;
  content: string;
}

const ChatInterface: React.FC = () => {
  const { id } = useParams();
  const thread = useThread(id);
  const [inputValue, setInputValue] = useState<string>("");
  const [username, setUsername] = useState<string>("User1");
  const messagesEndRef = useRef<HTMLDivElement | null>(null);
  if (!thread) {
    return null;
  }

  const { msgs } = thread;

  const sendMessage = () => {
    if (inputValue.trim()) {
      const i = formatDa(unixToDa(Date.now()));
      console.log(i);
      useStore.getState().addMsg(i, id, inputValue);
      //setMessages([...messages, { sender: username, content: inputValue }]);
      setInputValue("");
    }
  };

  const handleUsernameSwitch = () => {
    setUsername(username === "User1" ? "User2" : "User1");
  };

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

  return (
    <div className="flex flex-col h-screen">
      <div className="flex-1 p-4 overflow-y-auto">
        {msgs.map(({ role, text }, index) => (
          <div
            key={index}
            className={`mb-4 p-3 rounded ${
              role === "user" ? "bg-indigo-500 text-white" : "bg-gray-300"
            }`}
          >
            <div>{role}</div>
            <div>{text}</div>
          </div>
        ))}
        <div ref={messagesEndRef} />
      </div>
      <div className="bg-gray-200 p-4">
        <input
          type="text"
          placeholder="Type a message..."
          className="border border-gray-400 px-4 py-2 rounded w-full mr-4"
          value={inputValue}
          onChange={(e) => setInputValue(e.target.value)}
          onKeyPress={(e) => e.key === "Enter" && sendMessage()}
        />
        <button
          onClick={sendMessage}
          className="bg-indigo-500 text-white px-4 py-2 rounded"
        >
          Send
        </button>
      </div>
    </div>
  );
};

export default ChatInterface;
