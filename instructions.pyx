# SPDX-FileCopyrightText: 2020 Gerion Entrup <entrup@sra.uni-hannover.de>
# SPDX-FileCopyrightText: 2021 Gerion Entrup <entrup@sra.uni-hannover.de>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# cython: language_level=3
# vim: set et ts=4 sw=4:

cimport ir
from pyllco_helper cimport get, get_gep_offset
from libcpp cimport bool
from libc.stdint cimport int64_t

cdef class Instruction(User):
    pass

cdef class AtomicCmpXchgInst(Instruction):
    pass

cdef class AtomicRMWInst(Instruction):
    pass

cdef class BinaryOperator(Instruction):
    pass

cdef class BranchInst(Instruction):
    pass

cdef class CallBase(Instruction):
    pass

cdef class CallBrInst(Instruction):
    pass

cdef class CallInst(Instruction):
    pass

cdef class InvokeInst(Instruction):
    pass

cdef class CatchReturnInst(Instruction):
    pass

cdef class CatchSwitchInst(Instruction):
    pass

cdef class CleanupReturnInst(Instruction):
    pass

cdef class CmpInst(Instruction):
    pass

cdef class ICmpInst(Instruction):
    pass

cdef class FCmpInst(Instruction):
    pass

cdef class ExtractElementInst(Instruction):
    pass

cdef class FenceInst(Instruction):
    pass

cdef class FuncletPadInst(Instruction):
    pass

cdef class CleanupPadInst(Instruction):
    pass

cdef class CatchPadInst(Instruction):
    pass

cdef class GetElementPtrInst(Instruction):
    cdef inline ir.GetElementPtrInst* _gep_inst(self):
        return get[ir.GetElementPtrInst](self._val)

    def get_offset(self):
        """Accumulate the constant address offset of this GEP if possible.

        Python wrapper function. Return None if calculation not possible.
        """
        cdef int64_t offset = 0
        cdef bool res = get_gep_offset(deref(self._gep_inst()), offset)
        if res:
            return offset
        return None

cdef class IndirectBrInst(Instruction):
    pass

cdef class InsertElementInst(Instruction):
    pass

cdef class InsertValueInst(Instruction):
    pass

cdef class LandingPadInst(Instruction):
    pass

cdef class PHINode(Instruction):
    pass

cdef class ResumeInst(Instruction):
    pass

cdef class ReturnInst(Instruction):
    pass

cdef class SelectInst(Instruction):
    pass

cdef class ShuffleVectorInst(Instruction):
    pass

cdef class StoreInst(Instruction):
    pass

cdef class SwitchInst(Instruction):
    pass

cdef class UnaryInstruction(Instruction):
    pass

cdef class AllocaInst(Instruction):
    pass

cdef class CastInst(Instruction):
    pass

cdef class AddrSpaceCastInst(Instruction):
    pass

cdef class BitCastInst(Instruction):
    pass

cdef class FPExtInst(Instruction):
    pass

cdef class FPToSIInst(Instruction):
    pass

cdef class FPToUIInst(Instruction):
    pass

cdef class FPTruncInst(Instruction):
    pass

cdef class IntToPtrInst(Instruction):
    pass

cdef class PtrToIntInst(Instruction):
    pass

cdef class SExtInst(Instruction):
    pass

cdef class SIToFPInst(Instruction):
    pass

cdef class TruncInst(Instruction):
    pass

cdef class UIToFPInst(Instruction):
    pass

cdef class ZExtInst(Instruction):
    pass

cdef class ExtractValueInst(Instruction):
    pass

cdef class LoadInst(Instruction):
    pass

cdef class UnaryOperator(Instruction):
    pass

cdef class VAArgInst(Instruction):
    pass

cdef class UnreachableInst(Instruction):
    pass
