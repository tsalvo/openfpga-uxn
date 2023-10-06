-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 61
entity jmp2_0CLK_f7466064 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_f7466064;
architecture arch of jmp2_0CLK_f7466064 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l702_c6_728d]
signal BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l702_c1_7385]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l702_c2_f3fa]
signal t16_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l702_c2_f3fa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l702_c2_f3fa]
signal result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l702_c2_f3fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l702_c2_f3fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l702_c2_f3fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l702_c2_f3fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l702_c2_f3fa]
signal result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l703_c3_201d[uxn_opcodes_h_l703_c3_201d]
signal printf_uxn_opcodes_h_l703_c3_201d_uxn_opcodes_h_l703_c3_201d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l708_c11_f23b]
signal BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l708_c7_897c]
signal t16_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l708_c7_897c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l708_c7_897c]
signal result_pc_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l708_c7_897c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l708_c7_897c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l708_c7_897c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l708_c7_897c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l708_c7_897c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l711_c11_b1e5]
signal BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l711_c7_d0e4]
signal t16_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l711_c7_d0e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l711_c7_d0e4]
signal result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l711_c7_d0e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l711_c7_d0e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l711_c7_d0e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l711_c7_d0e4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l711_c7_d0e4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l713_c3_0fad]
signal CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l716_c11_4aac]
signal BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l716_c7_fac6]
signal t16_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l716_c7_fac6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l716_c7_fac6]
signal result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l716_c7_fac6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l716_c7_fac6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l716_c7_fac6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l716_c7_fac6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l716_c7_fac6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l719_c11_baf3]
signal BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l719_c7_8c95]
signal t16_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l719_c7_8c95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l719_c7_8c95]
signal result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l719_c7_8c95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l719_c7_8c95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l719_c7_8c95]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l719_c7_8c95]
signal result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l720_c3_66b0]
signal BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l723_c32_8e7b]
signal BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l723_c32_e854]
signal BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l723_c32_5128]
signal MUX_uxn_opcodes_h_l723_c32_5128_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l723_c32_5128_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l723_c32_5128_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l723_c32_5128_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l725_c11_5e31]
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_4810]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_4810]
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_4810]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l725_c7_4810]
signal result_pc_MUX_uxn_opcodes_h_l725_c7_4810_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l725_c7_4810_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l730_c11_03a0]
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_8961]
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l730_c7_8961]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_89b6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.pc := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d
BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_left,
BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_right,
BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_return_output);

-- t16_MUX_uxn_opcodes_h_l702_c2_f3fa
t16_MUX_uxn_opcodes_h_l702_c2_f3fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l702_c2_f3fa_cond,
t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue,
t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse,
t16_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output);

-- result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa
result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_cond,
result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue,
result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse,
result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa
result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa
result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output);

-- printf_uxn_opcodes_h_l703_c3_201d_uxn_opcodes_h_l703_c3_201d
printf_uxn_opcodes_h_l703_c3_201d_uxn_opcodes_h_l703_c3_201d : entity work.printf_uxn_opcodes_h_l703_c3_201d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l703_c3_201d_uxn_opcodes_h_l703_c3_201d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b
BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_left,
BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_right,
BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output);

-- t16_MUX_uxn_opcodes_h_l708_c7_897c
t16_MUX_uxn_opcodes_h_l708_c7_897c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l708_c7_897c_cond,
t16_MUX_uxn_opcodes_h_l708_c7_897c_iftrue,
t16_MUX_uxn_opcodes_h_l708_c7_897c_iffalse,
t16_MUX_uxn_opcodes_h_l708_c7_897c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output);

-- result_pc_MUX_uxn_opcodes_h_l708_c7_897c
result_pc_MUX_uxn_opcodes_h_l708_c7_897c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l708_c7_897c_cond,
result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iftrue,
result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iffalse,
result_pc_MUX_uxn_opcodes_h_l708_c7_897c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5
BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_left,
BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_right,
BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output);

-- t16_MUX_uxn_opcodes_h_l711_c7_d0e4
t16_MUX_uxn_opcodes_h_l711_c7_d0e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l711_c7_d0e4_cond,
t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue,
t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse,
t16_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output);

-- result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4
result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_cond,
result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue,
result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse,
result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4
result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l713_c3_0fad
CONST_SL_8_uxn_opcodes_h_l713_c3_0fad : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_x,
CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac
BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_left,
BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_right,
BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output);

-- t16_MUX_uxn_opcodes_h_l716_c7_fac6
t16_MUX_uxn_opcodes_h_l716_c7_fac6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l716_c7_fac6_cond,
t16_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue,
t16_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse,
t16_MUX_uxn_opcodes_h_l716_c7_fac6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6
result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output);

-- result_pc_MUX_uxn_opcodes_h_l716_c7_fac6
result_pc_MUX_uxn_opcodes_h_l716_c7_fac6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_cond,
result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue,
result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse,
result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6
result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6
result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6
result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3
BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_left,
BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_right,
BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output);

-- t16_MUX_uxn_opcodes_h_l719_c7_8c95
t16_MUX_uxn_opcodes_h_l719_c7_8c95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l719_c7_8c95_cond,
t16_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue,
t16_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse,
t16_MUX_uxn_opcodes_h_l719_c7_8c95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95
result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output);

-- result_pc_MUX_uxn_opcodes_h_l719_c7_8c95
result_pc_MUX_uxn_opcodes_h_l719_c7_8c95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_cond,
result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue,
result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse,
result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95
result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95
result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95
result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95
result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0
BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_left,
BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_right,
BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b
BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_left,
BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_right,
BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l723_c32_e854
BIN_OP_GT_uxn_opcodes_h_l723_c32_e854 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_left,
BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_right,
BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_return_output);

-- MUX_uxn_opcodes_h_l723_c32_5128
MUX_uxn_opcodes_h_l723_c32_5128 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l723_c32_5128_cond,
MUX_uxn_opcodes_h_l723_c32_5128_iftrue,
MUX_uxn_opcodes_h_l723_c32_5128_iffalse,
MUX_uxn_opcodes_h_l723_c32_5128_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31
BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_left,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_right,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_return_output);

-- result_pc_MUX_uxn_opcodes_h_l725_c7_4810
result_pc_MUX_uxn_opcodes_h_l725_c7_4810 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l725_c7_4810_cond,
result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iftrue,
result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iffalse,
result_pc_MUX_uxn_opcodes_h_l725_c7_4810_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0
BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_left,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_right,
BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_return_output,
 t16_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
 result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output,
 t16_MUX_uxn_opcodes_h_l708_c7_897c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output,
 result_pc_MUX_uxn_opcodes_h_l708_c7_897c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output,
 t16_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output,
 result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output,
 CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output,
 t16_MUX_uxn_opcodes_h_l716_c7_fac6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output,
 result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output,
 t16_MUX_uxn_opcodes_h_l719_c7_8c95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output,
 result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_return_output,
 BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_return_output,
 MUX_uxn_opcodes_h_l723_c32_5128_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_return_output,
 result_pc_MUX_uxn_opcodes_h_l725_c7_4810_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l705_c3_43b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l703_c3_201d_uxn_opcodes_h_l703_c3_201d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l709_c3_b311 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_6fa7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l717_c3_64d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l716_c7_fac6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l723_c32_5128_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l723_c32_5128_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l723_c32_5128_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l723_c32_5128_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l716_l711_l708_l702_l725_DUPLICATE_40fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l725_DUPLICATE_b4d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_DUPLICATE_762d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l730_DUPLICATE_3437_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l719_l716_l711_l708_l730_l725_DUPLICATE_15f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l716_l708_l719_l711_DUPLICATE_7fc7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l720_l712_DUPLICATE_fc31_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l698_l735_DUPLICATE_b45c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_6fa7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l714_c3_6fa7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l705_c3_43b4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l705_c3_43b4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l723_c32_5128_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l717_c3_64d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l717_c3_64d0;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l723_c32_5128_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l709_c3_b311 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l709_c3_b311;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_right := to_unsigned(6, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l716_c11_4aac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_left;
     BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output := BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l730_c11_03a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l716_c7_fac6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l716_c7_fac6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l702_c6_728d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_left;
     BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output := BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l711_c11_b1e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l720_l712_DUPLICATE_fc31 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l720_l712_DUPLICATE_fc31_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l716_l708_l719_l711_DUPLICATE_7fc7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l716_l708_l719_l711_DUPLICATE_7fc7_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l725_c11_5e31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_left;
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output := BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l725_DUPLICATE_b4d8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l725_DUPLICATE_b4d8_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l719_c11_baf3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_left;
     BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output := BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l730_DUPLICATE_3437 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l730_DUPLICATE_3437_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l716_l711_l708_l702_l725_DUPLICATE_40fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l716_l711_l708_l702_l725_DUPLICATE_40fc_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_DUPLICATE_762d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_DUPLICATE_762d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l708_c11_f23b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_left;
     BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output := BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l723_c32_8e7b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_left;
     BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_return_output := BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l719_l716_l711_l708_l730_l725_DUPLICATE_15f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l719_l716_l711_l708_l730_l725_DUPLICATE_15f2_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_left := VAR_BIN_OP_AND_uxn_opcodes_h_l723_c32_8e7b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l702_c6_728d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_f23b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_b1e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l716_c11_4aac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l719_c11_baf3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_5e31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l730_c11_03a0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l720_l712_DUPLICATE_fc31_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l720_l712_DUPLICATE_fc31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_DUPLICATE_762d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_DUPLICATE_762d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_DUPLICATE_762d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_DUPLICATE_762d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_DUPLICATE_762d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l725_DUPLICATE_b4d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l725_DUPLICATE_b4d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l725_DUPLICATE_b4d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l725_DUPLICATE_b4d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l725_DUPLICATE_b4d8_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l725_DUPLICATE_b4d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l719_l716_l711_l708_l730_l725_DUPLICATE_15f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l719_l716_l711_l708_l730_l725_DUPLICATE_15f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l719_l716_l711_l708_l730_l725_DUPLICATE_15f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l719_l716_l711_l708_l730_l725_DUPLICATE_15f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l719_l716_l711_l708_l730_l725_DUPLICATE_15f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l719_l716_l711_l708_l730_l725_DUPLICATE_15f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l730_DUPLICATE_3437_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l730_DUPLICATE_3437_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l730_DUPLICATE_3437_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l730_DUPLICATE_3437_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l730_DUPLICATE_3437_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l719_l716_l711_l708_l702_l730_DUPLICATE_3437_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l716_l711_l708_l702_l725_DUPLICATE_40fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l716_l711_l708_l702_l725_DUPLICATE_40fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l716_l711_l708_l702_l725_DUPLICATE_40fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l716_l711_l708_l702_l725_DUPLICATE_40fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l716_l711_l708_l702_l725_DUPLICATE_40fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l716_l708_l719_l711_DUPLICATE_7fc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l716_l708_l719_l711_DUPLICATE_7fc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l716_l708_l719_l711_DUPLICATE_7fc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l716_l708_l719_l711_DUPLICATE_7fc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l716_c7_fac6_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l713_c3_0fad] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_x <= VAR_CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_return_output := CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l716_c7_fac6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l719_c7_8c95] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l730_c7_8961] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l720_c3_66b0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_left;
     BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_return_output := BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l725_c7_4810] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l730_c7_8961] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l723_c32_e854] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_left;
     BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_return_output := BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l725_c7_4810] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l725_c7_4810_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_cond;
     result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iftrue;
     result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_return_output := result_pc_MUX_uxn_opcodes_h_l725_c7_4810_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l702_c1_7385] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l723_c32_5128_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l723_c32_e854_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l720_c3_66b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l713_c3_0fad_return_output;
     VAR_printf_uxn_opcodes_h_l703_c3_201d_uxn_opcodes_h_l703_c3_201d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l702_c1_7385_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l730_c7_8961_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l730_c7_8961_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l725_c7_4810_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l725_c7_4810_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l725_c7_4810] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_4810] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_return_output;

     -- t16_MUX[uxn_opcodes_h_l719_c7_8c95] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l719_c7_8c95_cond <= VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_cond;
     t16_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue;
     t16_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_return_output := t16_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l716_c7_fac6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l719_c7_8c95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;

     -- MUX[uxn_opcodes_h_l723_c32_5128] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l723_c32_5128_cond <= VAR_MUX_uxn_opcodes_h_l723_c32_5128_cond;
     MUX_uxn_opcodes_h_l723_c32_5128_iftrue <= VAR_MUX_uxn_opcodes_h_l723_c32_5128_iftrue;
     MUX_uxn_opcodes_h_l723_c32_5128_iffalse <= VAR_MUX_uxn_opcodes_h_l723_c32_5128_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l723_c32_5128_return_output := MUX_uxn_opcodes_h_l723_c32_5128_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l711_c7_d0e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l719_c7_8c95] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_cond;
     result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue;
     result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_return_output := result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;

     -- printf_uxn_opcodes_h_l703_c3_201d[uxn_opcodes_h_l703_c3_201d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l703_c3_201d_uxn_opcodes_h_l703_c3_201d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l703_c3_201d_uxn_opcodes_h_l703_c3_201d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue := VAR_MUX_uxn_opcodes_h_l723_c32_5128_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_4810_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l725_c7_4810_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l716_c7_fac6] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_cond;
     result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue;
     result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_return_output := result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;

     -- t16_MUX[uxn_opcodes_h_l716_c7_fac6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l716_c7_fac6_cond <= VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_cond;
     t16_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue;
     t16_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_return_output := t16_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l719_c7_8c95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l708_c7_897c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l719_c7_8c95] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l711_c7_d0e4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l716_c7_fac6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l719_c7_8c95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l719_c7_8c95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_897c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l716_c7_fac6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;

     -- t16_MUX[uxn_opcodes_h_l711_c7_d0e4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l711_c7_d0e4_cond <= VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_cond;
     t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue;
     t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output := t16_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l711_c7_d0e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l711_c7_d0e4] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_cond;
     result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue;
     result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output := result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l716_c7_fac6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l702_c2_f3fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l716_c7_fac6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l708_c7_897c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_897c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l716_c7_fac6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;
     -- result_pc_MUX[uxn_opcodes_h_l708_c7_897c] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l708_c7_897c_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_cond;
     result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iftrue;
     result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_return_output := result_pc_MUX_uxn_opcodes_h_l708_c7_897c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l711_c7_d0e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l708_c7_897c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l711_c7_d0e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l702_c2_f3fa] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l711_c7_d0e4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;

     -- t16_MUX[uxn_opcodes_h_l708_c7_897c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l708_c7_897c_cond <= VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_cond;
     t16_MUX_uxn_opcodes_h_l708_c7_897c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_iftrue;
     t16_MUX_uxn_opcodes_h_l708_c7_897c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_return_output := t16_MUX_uxn_opcodes_h_l708_c7_897c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l708_c7_897c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l711_c7_d0e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l708_c7_897c_return_output;
     -- t16_MUX[uxn_opcodes_h_l702_c2_f3fa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l702_c2_f3fa_cond <= VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_cond;
     t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue;
     t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output := t16_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l708_c7_897c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l708_c7_897c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l708_c7_897c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l702_c2_f3fa] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_cond;
     result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue;
     result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output := result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l702_c2_f3fa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_897c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l708_c7_897c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_897c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l702_c2_f3fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l702_c2_f3fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l702_c2_f3fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l698_l735_DUPLICATE_b45c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l698_l735_DUPLICATE_b45c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_89b6(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l702_c2_f3fa_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l698_l735_DUPLICATE_b45c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_89b6_uxn_opcodes_h_l698_l735_DUPLICATE_b45c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
