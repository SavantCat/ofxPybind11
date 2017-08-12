

#pragma once
#include "ofMain.h"

#include "pybind11.h"
#include "eval.h"
#include "stl.h"

namespace plotter {
	namespace py = pybind11;

	template<typename T>
	static vector<T> resamping(vector<T> &numArray, int size) {
		Py_InitializeEx(1);

		auto global = py::dict(py::module::import("__main__").attr("__dict__"));
		auto local = py::dict();

		local["numArray"] = numArray;

		string code = {
			"from scipy import signal\n"
			"result = signal.resample(numArray, " + ofToString(size) + ")\n"
		};

		py::eval<py::eval_statements>(code.c_str(), global, local);

		numArray.clear();
		for (auto num : local["result"]) {
			numArray.push_back(num.cast<T>());
		}

		return numArray;
	}
}