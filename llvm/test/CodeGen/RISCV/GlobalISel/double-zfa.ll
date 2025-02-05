; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 5

; RUN: llc -mtriple=riscv32 -mattr=+zfa,d -global-isel < %s \
; RUN: | FileCheck %s
; RUN: llc -mtriple=riscv64 -mattr=+zfa,d -global-isel < %s \
; RUN: | FileCheck %s


define double @fceil(double %a) {
; CHECK-LABEL: fceil:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fround.d fa0, fa0, rup
; CHECK-NEXT:    ret
  %b = call double @llvm.ceil.f64(double %a)
  ret double %b
}

define double @ffloor(double %a) {
; CHECK-LABEL: ffloor:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fround.d fa0, fa0, rdn
; CHECK-NEXT:    ret
  %b = call double @llvm.floor.f64(double %a)
  ret double %b
}

define double @frint(double %a) {
; CHECK-LABEL: frint:
; CHECK:       # %bb.0:
; CHECK-NEXT:    froundnx.d fa0, fa0
; CHECK-NEXT:    ret
  %b = call double @llvm.rint.f64(double %a)
  ret double %b
}

define double @fnearbyint(double %a) {
; CHECK-LABEL: fnearbyint:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fround.d fa0, fa0
; CHECK-NEXT:    ret
  %b = call double @llvm.nearbyint.f64(double %a)
  ret double %b
}

define double @fround(double %a) {
; CHECK-LABEL: fround:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fround.d fa0, fa0, rmm
; CHECK-NEXT:    ret
  %b = call double @llvm.round.f64(double %a)
  ret double %b
}

define double @froundeven(double %a) {
; CHECK-LABEL: froundeven:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fround.d fa0, fa0, rne
; CHECK-NEXT:    ret
  %b = call double @llvm.roundeven.f64(double %a)
  ret double %b
}

define double @ftrunc(double %a) {
; CHECK-LABEL: ftrunc:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fround.d fa0, fa0, rtz
; CHECK-NEXT:    ret
  %b = call double @llvm.trunc.f64(double %a)
  ret double %b
}

define double @fmaximum(double %a, double %b) {
; CHECK-LABEL: fmaximum:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmaxm.d fa0, fa0, fa1
; CHECK-NEXT:    ret
  %c = call double @llvm.maximum.f64(double %a, double %b)
  ret double %c
}

define double @fminimum(double %a, double %b) {
; CHECK-LABEL: fminimum:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fminm.d fa0, fa0, fa1
; CHECK-NEXT:    ret
  %c = call double @llvm.minimum.f64(double %a, double %b)
  ret double %c
}
