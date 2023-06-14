// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsolve_linear_equations.h"

extern XSolve_linear_equations_Config XSolve_linear_equations_ConfigTable[];

XSolve_linear_equations_Config *XSolve_linear_equations_LookupConfig(u16 DeviceId) {
	XSolve_linear_equations_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSOLVE_LINEAR_EQUATIONS_NUM_INSTANCES; Index++) {
		if (XSolve_linear_equations_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSolve_linear_equations_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSolve_linear_equations_Initialize(XSolve_linear_equations *InstancePtr, u16 DeviceId) {
	XSolve_linear_equations_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSolve_linear_equations_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSolve_linear_equations_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

