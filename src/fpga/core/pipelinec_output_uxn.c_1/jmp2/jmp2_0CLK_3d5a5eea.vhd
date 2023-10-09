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
-- Submodules: 57
entity jmp2_0CLK_3d5a5eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp2_0CLK_3d5a5eea;
architecture arch of jmp2_0CLK_3d5a5eea is
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
-- BIN_OP_EQ[uxn_opcodes_h_l686_c6_6782]
signal BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l686_c1_4209]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l686_c2_bf9e]
signal t16_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l686_c2_bf9e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l686_c2_bf9e]
signal result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l686_c2_bf9e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l686_c2_bf9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l686_c2_bf9e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l686_c2_bf9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l686_c2_bf9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l687_c3_dec0[uxn_opcodes_h_l687_c3_dec0]
signal printf_uxn_opcodes_h_l687_c3_dec0_uxn_opcodes_h_l687_c3_dec0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l692_c11_bdec]
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l692_c7_5ecf]
signal t16_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_5ecf]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l692_c7_5ecf]
signal result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l692_c7_5ecf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_5ecf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_5ecf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_5ecf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l692_c7_5ecf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l695_c11_8556]
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l695_c7_b114]
signal t16_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l695_c7_b114]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l695_c7_b114]
signal result_pc_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l695_c7_b114]
signal result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l695_c7_b114]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_b114]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_b114]
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_b114]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l697_c3_0b04]
signal CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l700_c11_3eee]
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l700_c7_2774]
signal t16_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_2774]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l700_c7_2774]
signal result_pc_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l700_c7_2774]
signal result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_2774]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_2774]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_2774]
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_2774]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l703_c11_5ed7]
signal BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l703_c7_2e7a]
signal t16_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l703_c7_2e7a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l703_c7_2e7a]
signal result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l703_c7_2e7a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l703_c7_2e7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l703_c7_2e7a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l703_c7_2e7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l704_c3_a89f]
signal BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l707_c32_b0e9]
signal BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l707_c32_7830]
signal BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l707_c32_7c3f]
signal MUX_uxn_opcodes_h_l707_c32_7c3f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l707_c32_7c3f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l707_c32_7c3f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l707_c32_7c3f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l711_c11_ccf5]
signal BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l711_c7_4c0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l711_c7_4c0f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l711_c7_4c0f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_747d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.pc := ref_toks_2;
      base.is_stack_read := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782
BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_left,
BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_right,
BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_return_output);

-- t16_MUX_uxn_opcodes_h_l686_c2_bf9e
t16_MUX_uxn_opcodes_h_l686_c2_bf9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l686_c2_bf9e_cond,
t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue,
t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse,
t16_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output);

-- result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e
result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_cond,
result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue,
result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse,
result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e
result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e
result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output);

-- printf_uxn_opcodes_h_l687_c3_dec0_uxn_opcodes_h_l687_c3_dec0
printf_uxn_opcodes_h_l687_c3_dec0_uxn_opcodes_h_l687_c3_dec0 : entity work.printf_uxn_opcodes_h_l687_c3_dec0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l687_c3_dec0_uxn_opcodes_h_l687_c3_dec0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec
BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_left,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_right,
BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output);

-- t16_MUX_uxn_opcodes_h_l692_c7_5ecf
t16_MUX_uxn_opcodes_h_l692_c7_5ecf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l692_c7_5ecf_cond,
t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue,
t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse,
t16_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output);

-- result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf
result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_cond,
result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue,
result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse,
result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf
result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556
BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_left,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_right,
BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output);

-- t16_MUX_uxn_opcodes_h_l695_c7_b114
t16_MUX_uxn_opcodes_h_l695_c7_b114 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l695_c7_b114_cond,
t16_MUX_uxn_opcodes_h_l695_c7_b114_iftrue,
t16_MUX_uxn_opcodes_h_l695_c7_b114_iffalse,
t16_MUX_uxn_opcodes_h_l695_c7_b114_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_return_output);

-- result_pc_MUX_uxn_opcodes_h_l695_c7_b114
result_pc_MUX_uxn_opcodes_h_l695_c7_b114 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l695_c7_b114_cond,
result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iftrue,
result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iffalse,
result_pc_MUX_uxn_opcodes_h_l695_c7_b114_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_return_output);

-- CONST_SL_8_uxn_opcodes_h_l697_c3_0b04
CONST_SL_8_uxn_opcodes_h_l697_c3_0b04 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_x,
CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee
BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_left,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_right,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output);

-- t16_MUX_uxn_opcodes_h_l700_c7_2774
t16_MUX_uxn_opcodes_h_l700_c7_2774 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l700_c7_2774_cond,
t16_MUX_uxn_opcodes_h_l700_c7_2774_iftrue,
t16_MUX_uxn_opcodes_h_l700_c7_2774_iffalse,
t16_MUX_uxn_opcodes_h_l700_c7_2774_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_return_output);

-- result_pc_MUX_uxn_opcodes_h_l700_c7_2774
result_pc_MUX_uxn_opcodes_h_l700_c7_2774 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l700_c7_2774_cond,
result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iftrue,
result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iffalse,
result_pc_MUX_uxn_opcodes_h_l700_c7_2774_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7
BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_left,
BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_right,
BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output);

-- t16_MUX_uxn_opcodes_h_l703_c7_2e7a
t16_MUX_uxn_opcodes_h_l703_c7_2e7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l703_c7_2e7a_cond,
t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue,
t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse,
t16_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output);

-- result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a
result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_cond,
result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue,
result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse,
result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a
result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f
BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_left,
BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_right,
BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9
BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_left,
BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_right,
BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l707_c32_7830
BIN_OP_GT_uxn_opcodes_h_l707_c32_7830 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_left,
BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_right,
BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_return_output);

-- MUX_uxn_opcodes_h_l707_c32_7c3f
MUX_uxn_opcodes_h_l707_c32_7c3f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l707_c32_7c3f_cond,
MUX_uxn_opcodes_h_l707_c32_7c3f_iftrue,
MUX_uxn_opcodes_h_l707_c32_7c3f_iffalse,
MUX_uxn_opcodes_h_l707_c32_7c3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5
BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_left,
BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_right,
BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_return_output,
 t16_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
 result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output,
 t16_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output,
 result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output,
 t16_MUX_uxn_opcodes_h_l695_c7_b114_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_return_output,
 result_pc_MUX_uxn_opcodes_h_l695_c7_b114_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_return_output,
 CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output,
 t16_MUX_uxn_opcodes_h_l700_c7_2774_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_return_output,
 result_pc_MUX_uxn_opcodes_h_l700_c7_2774_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output,
 t16_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output,
 result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_return_output,
 MUX_uxn_opcodes_h_l707_c32_7c3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_af42 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l687_c3_dec0_uxn_opcodes_h_l687_c3_dec0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l693_c3_eb10 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_a609 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l701_c3_5bec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l700_c7_2774_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_572d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_a98a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_0cb0_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_51e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l700_l692_l703_l695_DUPLICATE_3646_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l695_l692_l711_l703_DUPLICATE_656d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l696_l704_DUPLICATE_6806_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l717_l682_DUPLICATE_3290_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l693_c3_eb10 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l693_c3_eb10;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l701_c3_5bec := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l701_c3_5bec;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_a609 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_a609;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_af42 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l689_c3_af42;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l700_c11_3eee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_left;
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output := BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_0cb0 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_0cb0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l686_c6_6782] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_left;
     BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output := BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_572d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_572d_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l696_l704_DUPLICATE_6806 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l696_l704_DUPLICATE_6806_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l703_c11_5ed7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_left;
     BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output := BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l707_c32_b0e9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_left;
     BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_return_output := BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l700_c7_2774] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l700_c7_2774_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l695_c11_8556] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_left;
     BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output := BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l692_c11_bdec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_left;
     BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output := BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l700_l692_l703_l695_DUPLICATE_3646 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l700_l692_l703_l695_DUPLICATE_3646_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l711_c11_ccf5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_left;
     BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_return_output := BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_a98a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_a98a_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l695_l692_l711_l703_DUPLICATE_656d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l695_l692_l711_l703_DUPLICATE_656d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_51e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_51e5_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_left := VAR_BIN_OP_AND_uxn_opcodes_h_l707_c32_b0e9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l686_c6_6782_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l692_c11_bdec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l695_c11_8556_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_3eee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l703_c11_5ed7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l711_c11_ccf5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l696_l704_DUPLICATE_6806_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l696_l704_DUPLICATE_6806_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_0cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_0cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_0cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_0cb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_0cb0_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_a98a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_a98a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_a98a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_a98a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l700_l695_l692_l686_l703_DUPLICATE_a98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l695_l692_l711_l703_DUPLICATE_656d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l695_l692_l711_l703_DUPLICATE_656d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l695_l692_l711_l703_DUPLICATE_656d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l695_l692_l711_l703_DUPLICATE_656d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l700_l695_l692_l711_l703_DUPLICATE_656d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_572d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_572d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_572d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_572d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_572d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_51e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_51e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_51e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_51e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l700_l695_l692_l686_l711_DUPLICATE_51e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l700_l692_l703_l695_DUPLICATE_3646_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l700_l692_l703_l695_DUPLICATE_3646_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l700_l692_l703_l695_DUPLICATE_3646_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l700_l692_l703_l695_DUPLICATE_3646_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l700_c7_2774_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l686_c1_4209] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l697_c3_0b04] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_x <= VAR_CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_return_output := CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l703_c7_2e7a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l711_c7_4c0f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l711_c7_4c0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_2774] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l707_c32_7830] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_left;
     BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_return_output := BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l711_c7_4c0f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l704_c3_a89f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_left;
     BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_return_output := BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l707_c32_7830_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l704_c3_a89f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l697_c3_0b04_return_output;
     VAR_printf_uxn_opcodes_h_l687_c3_dec0_uxn_opcodes_h_l687_c3_dec0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l686_c1_4209_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l711_c7_4c0f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_2774_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l695_c7_b114] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_return_output;

     -- MUX[uxn_opcodes_h_l707_c32_7c3f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l707_c32_7c3f_cond <= VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_cond;
     MUX_uxn_opcodes_h_l707_c32_7c3f_iftrue <= VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_iftrue;
     MUX_uxn_opcodes_h_l707_c32_7c3f_iffalse <= VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_return_output := MUX_uxn_opcodes_h_l707_c32_7c3f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l703_c7_2e7a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;

     -- t16_MUX[uxn_opcodes_h_l703_c7_2e7a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l703_c7_2e7a_cond <= VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_cond;
     t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue;
     t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output := t16_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l700_c7_2774] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_return_output;

     -- printf_uxn_opcodes_h_l687_c3_dec0[uxn_opcodes_h_l687_c3_dec0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l687_c3_dec0_uxn_opcodes_h_l687_c3_dec0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l687_c3_dec0_uxn_opcodes_h_l687_c3_dec0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l703_c7_2e7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l703_c7_2e7a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l703_c7_2e7a] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_cond;
     result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue;
     result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output := result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue := VAR_MUX_uxn_opcodes_h_l707_c32_7c3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_2774_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l695_c7_b114_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_iffalse := VAR_t16_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_2774] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l700_c7_2774] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l700_c7_2774_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_cond;
     result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iftrue;
     result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_return_output := result_pc_MUX_uxn_opcodes_h_l700_c7_2774_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l700_c7_2774] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_return_output;

     -- t16_MUX[uxn_opcodes_h_l700_c7_2774] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l700_c7_2774_cond <= VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_cond;
     t16_MUX_uxn_opcodes_h_l700_c7_2774_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_iftrue;
     t16_MUX_uxn_opcodes_h_l700_c7_2774_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_return_output := t16_MUX_uxn_opcodes_h_l700_c7_2774_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l695_c7_b114] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l692_c7_5ecf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l703_c7_2e7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_2774] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_2774_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l700_c7_2774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l695_c7_b114_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l700_c7_2774_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l703_c7_2e7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_iffalse := VAR_t16_MUX_uxn_opcodes_h_l700_c7_2774_return_output;
     -- t16_MUX[uxn_opcodes_h_l695_c7_b114] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l695_c7_b114_cond <= VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_cond;
     t16_MUX_uxn_opcodes_h_l695_c7_b114_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_iftrue;
     t16_MUX_uxn_opcodes_h_l695_c7_b114_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_return_output := t16_MUX_uxn_opcodes_h_l695_c7_b114_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l695_c7_b114] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l692_c7_5ecf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l686_c2_bf9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_2774] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l695_c7_b114] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l695_c7_b114] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l695_c7_b114_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_cond;
     result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iftrue;
     result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_return_output := result_pc_MUX_uxn_opcodes_h_l695_c7_b114_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l695_c7_b114] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l695_c7_b114_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l695_c7_b114_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l695_c7_b114_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_2774_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l695_c7_b114_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l692_c7_5ecf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l695_c7_b114] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l692_c7_5ecf] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l686_c2_bf9e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l692_c7_5ecf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l692_c7_5ecf] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_cond;
     result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue;
     result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output := result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;

     -- t16_MUX[uxn_opcodes_h_l692_c7_5ecf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l692_c7_5ecf_cond <= VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_cond;
     t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue;
     t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output := t16_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l695_c7_b114_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;
     -- t16_MUX[uxn_opcodes_h_l686_c2_bf9e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l686_c2_bf9e_cond <= VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_cond;
     t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue;
     t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output := t16_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l686_c2_bf9e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l686_c2_bf9e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l686_c2_bf9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l692_c7_5ecf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l686_c2_bf9e] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_cond;
     result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue;
     result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output := result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l692_c7_5ecf_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l686_c2_bf9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l717_l682_DUPLICATE_3290 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l717_l682_DUPLICATE_3290_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_747d(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l686_c2_bf9e_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l717_l682_DUPLICATE_3290_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_747d_uxn_opcodes_h_l717_l682_DUPLICATE_3290_return_output;
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
