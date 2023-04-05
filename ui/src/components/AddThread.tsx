// AddThread.tsx
import React from "react";
import { useForm } from "react-hook-form";
import { formatUv } from "@urbit/aura";
import useStore from "../state/store";

type FormData = {
  title: string;
  model: string;
};

const genId = () => {
  const bytes = new Uint8Array(32);

  // load cryptographically random bytes into array
  window.crypto.getRandomValues(bytes);

  // convert byte array to hexademical representation
  const bytesHex = bytes.reduce(
    (o, v) => o + ("00" + v.toString(16)).slice(-2),
    ""
  );

  // convert hexademical value to a decimal string
  return formatUv(BigInt("0x" + bytesHex).toString(10));
};

const AddThread: React.FC = () => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<FormData>();

  const onSubmit = async (data: FormData) => {
    const id = genId();
    await useStore.getState().addThread(id, data);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-4">
      <div>
        <label htmlFor="title" className="block text-gray-700">
          Title
        </label>
        <input
          type="text"
          id="title"
          {...register("title", { required: "Title is required" })}
          className={`block w-full mt-1 border border-gray-300 rounded p-2 ${
            errors.title ? "border-red-500" : ""
          }`}
        />
        {errors.title && (
          <p className="text-red-500 text-sm mt-1">{errors.title.message}</p>
        )}
      </div>
      <div>
        <label htmlFor="model" className="block text-gray-700">
          Model
        </label>
        <select
          id="model"
          {...register("model", { required: "Model is required" })}
          className={`block w-full mt-1 border border-gray-300 rounded p-2 ${
            errors.model ? "border-red-500" : ""
          }`}
        >
          <option value="">Select a model...</option>
          <option value="gpt-4">gpt-4</option>
          <option value="gpt-3.5-turbo">gpt-3.5-turbo</option>
        </select>
        {errors.model && (
          <p className="text-red-500 text-sm mt-1">{errors.model.message}</p>
        )}
      </div>
      <button
        type="submit"
        className="bg-blue-600 text-white px-4 py-2 rounded"
      >
        Submit
      </button>
    </form>
  );
};

export default AddThread;
