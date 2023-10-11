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
-- Submodules: 108
entity sta2_0CLK_83f22136 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_83f22136;
architecture arch of sta2_0CLK_83f22136 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2541_c6_15f7]
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2541_c1_2578]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2541_c2_54af]
signal n16_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2541_c2_54af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2541_c2_54af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2541_c2_54af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2541_c2_54af]
signal result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2541_c2_54af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2541_c2_54af]
signal result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2541_c2_54af]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2541_c2_54af]
signal t16_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2542_c3_7c6d[uxn_opcodes_h_l2542_c3_7c6d]
signal printf_uxn_opcodes_h_l2542_c3_7c6d_uxn_opcodes_h_l2542_c3_7c6d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2546_c11_d6ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2546_c7_d1e7]
signal n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2546_c7_d1e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2546_c7_d1e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2546_c7_d1e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2546_c7_d1e7]
signal result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2546_c7_d1e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2546_c7_d1e7]
signal result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2546_c7_d1e7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2546_c7_d1e7]
signal t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2549_c11_3b8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2549_c7_7133]
signal n16_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2549_c7_7133]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2549_c7_7133]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2549_c7_7133]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2549_c7_7133]
signal result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2549_c7_7133]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2549_c7_7133]
signal result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2549_c7_7133]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2549_c7_7133]
signal t16_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2554_c11_4c29]
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2554_c7_98cb]
signal n16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2554_c7_98cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2554_c7_98cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2554_c7_98cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2554_c7_98cb]
signal result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2554_c7_98cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2554_c7_98cb]
signal result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2554_c7_98cb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2554_c7_98cb]
signal t16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2557_c11_9031]
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2557_c7_a562]
signal n16_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2557_c7_a562]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2557_c7_a562]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2557_c7_a562]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2557_c7_a562]
signal result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2557_c7_a562]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2557_c7_a562]
signal result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2557_c7_a562]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2557_c7_a562]
signal t16_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2558_c3_f99a]
signal BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_d1bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2561_c7_d9b5]
signal n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_d9b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_d9b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_d9b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2561_c7_d9b5]
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2561_c7_d9b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2561_c7_d9b5]
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2561_c7_d9b5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_077f]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2564_c7_f901]
signal n16_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_f901]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_f901]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_f901]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2564_c7_f901]
signal result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2564_c7_f901]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2564_c7_f901]
signal result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2564_c7_f901]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_6f43]
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2569_c7_6b1f]
signal n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2569_c7_6b1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2569_c7_6b1f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2569_c7_6b1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2569_c7_6b1f]
signal result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2569_c7_6b1f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2569_c7_6b1f]
signal result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2569_c7_6b1f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2572_c11_d1bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2572_c7_48b5]
signal n16_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2572_c7_48b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2572_c7_48b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2572_c7_48b5]
signal result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2572_c7_48b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2572_c7_48b5]
signal result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2572_c7_48b5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2573_c3_ad24]
signal BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2575_c32_c867]
signal BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2575_c32_b974]
signal BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2575_c32_c1df]
signal MUX_uxn_opcodes_h_l2575_c32_c1df_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2575_c32_c1df_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2575_c32_c1df_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2575_c32_c1df_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2578_c32_27e9]
signal CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_f525]
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2580_c7_5dbc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2580_c7_5dbc]
signal result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2580_c7_5dbc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2580_c7_5dbc]
signal result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2580_c7_5dbc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2582_c21_72bc]
signal BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2585_c11_9742]
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c7_e16b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c7_e16b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7
BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_left,
BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_right,
BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_return_output);

-- n16_MUX_uxn_opcodes_h_l2541_c2_54af
n16_MUX_uxn_opcodes_h_l2541_c2_54af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2541_c2_54af_cond,
n16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue,
n16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse,
n16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af
result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af
result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_cond,
result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af
result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

-- t16_MUX_uxn_opcodes_h_l2541_c2_54af
t16_MUX_uxn_opcodes_h_l2541_c2_54af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2541_c2_54af_cond,
t16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue,
t16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse,
t16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

-- printf_uxn_opcodes_h_l2542_c3_7c6d_uxn_opcodes_h_l2542_c3_7c6d
printf_uxn_opcodes_h_l2542_c3_7c6d_uxn_opcodes_h_l2542_c3_7c6d : entity work.printf_uxn_opcodes_h_l2542_c3_7c6d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2542_c3_7c6d_uxn_opcodes_h_l2542_c3_7c6d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output);

-- n16_MUX_uxn_opcodes_h_l2546_c7_d1e7
n16_MUX_uxn_opcodes_h_l2546_c7_d1e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond,
n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue,
n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse,
n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7
result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7
result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond,
result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7
result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output);

-- t16_MUX_uxn_opcodes_h_l2546_c7_d1e7
t16_MUX_uxn_opcodes_h_l2546_c7_d1e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond,
t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue,
t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse,
t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output);

-- n16_MUX_uxn_opcodes_h_l2549_c7_7133
n16_MUX_uxn_opcodes_h_l2549_c7_7133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2549_c7_7133_cond,
n16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue,
n16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse,
n16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133
result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133
result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_cond,
result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133
result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_return_output);

-- t16_MUX_uxn_opcodes_h_l2549_c7_7133
t16_MUX_uxn_opcodes_h_l2549_c7_7133 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2549_c7_7133_cond,
t16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue,
t16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse,
t16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_left,
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_right,
BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output);

-- n16_MUX_uxn_opcodes_h_l2554_c7_98cb
n16_MUX_uxn_opcodes_h_l2554_c7_98cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond,
n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue,
n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse,
n16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb
result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb
result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_cond,
result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb
result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output);

-- t16_MUX_uxn_opcodes_h_l2554_c7_98cb
t16_MUX_uxn_opcodes_h_l2554_c7_98cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond,
t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue,
t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse,
t16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_left,
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_right,
BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output);

-- n16_MUX_uxn_opcodes_h_l2557_c7_a562
n16_MUX_uxn_opcodes_h_l2557_c7_a562 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2557_c7_a562_cond,
n16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue,
n16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse,
n16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562
result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562
result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_cond,
result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562
result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_return_output);

-- t16_MUX_uxn_opcodes_h_l2557_c7_a562
t16_MUX_uxn_opcodes_h_l2557_c7_a562 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2557_c7_a562_cond,
t16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue,
t16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse,
t16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a
BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_left,
BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_right,
BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output);

-- n16_MUX_uxn_opcodes_h_l2561_c7_d9b5
n16_MUX_uxn_opcodes_h_l2561_c7_d9b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond,
n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue,
n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse,
n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond,
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output);

-- n16_MUX_uxn_opcodes_h_l2564_c7_f901
n16_MUX_uxn_opcodes_h_l2564_c7_f901 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2564_c7_f901_cond,
n16_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue,
n16_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse,
n16_MUX_uxn_opcodes_h_l2564_c7_f901_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901
result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901
result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_cond,
result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_left,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_right,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output);

-- n16_MUX_uxn_opcodes_h_l2569_c7_6b1f
n16_MUX_uxn_opcodes_h_l2569_c7_6b1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond,
n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue,
n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse,
n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f
result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f
result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond,
result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f
result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd
BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output);

-- n16_MUX_uxn_opcodes_h_l2572_c7_48b5
n16_MUX_uxn_opcodes_h_l2572_c7_48b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2572_c7_48b5_cond,
n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue,
n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse,
n16_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5
result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5
result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5
result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5
result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_cond,
result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5
result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24
BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_left,
BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_right,
BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867
BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_left,
BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_right,
BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974
BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_left,
BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_right,
BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_return_output);

-- MUX_uxn_opcodes_h_l2575_c32_c1df
MUX_uxn_opcodes_h_l2575_c32_c1df : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2575_c32_c1df_cond,
MUX_uxn_opcodes_h_l2575_c32_c1df_iftrue,
MUX_uxn_opcodes_h_l2575_c32_c1df_iffalse,
MUX_uxn_opcodes_h_l2575_c32_c1df_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9
CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_x,
CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_left,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_right,
BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc
result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc
result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc
result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond,
result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc
result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc
BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_left,
BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_right,
BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_left,
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_right,
BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118
CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_return_output,
 n16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
 t16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output,
 n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output,
 t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output,
 n16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_return_output,
 t16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output,
 n16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output,
 t16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output,
 n16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_return_output,
 t16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output,
 n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output,
 n16_MUX_uxn_opcodes_h_l2564_c7_f901_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output,
 n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output,
 n16_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_return_output,
 MUX_uxn_opcodes_h_l2575_c32_c1df_return_output,
 CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2543_c3_a5a4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2542_c3_7c6d_uxn_opcodes_h_l2542_c3_7c6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_0569 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_33dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2555_c3_111e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_e8fa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_d7a6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_0dcd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2570_c3_7910 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2569_c7_6b1f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2578_c22_5871_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2582_c3_74a9 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2583_c22_1980_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2573_l2550_l2558_l2565_DUPLICATE_11c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2590_l2537_DUPLICATE_a688_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_e8fa := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_e8fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2570_c3_7910 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2570_c3_7910;
     VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2555_c3_111e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2555_c3_111e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_right := to_unsigned(8, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_d7a6 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_d7a6;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_iffalse := resize(to_signed(-4, 4), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_0dcd := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_0dcd;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_33dc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2552_c3_33dc;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2543_c3_a5a4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2543_c3_a5a4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_0569 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_0569;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2585_c11_9742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_left;
     BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_return_output := BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2572_c11_d1bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_d1bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2573_l2550_l2558_l2565_DUPLICATE_11c2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2573_l2550_l2558_l2565_DUPLICATE_11c2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2557_c11_9031] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_left;
     BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output := BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2541_c6_15f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_6f43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_left;
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output := BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_077f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2549_c11_3b8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2546_c11_d6ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2583_c22_1980] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2583_c22_1980_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output := result.ram_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2575_c32_c867] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_left;
     BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_return_output := BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output := result.ram_addr;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2569_c7_6b1f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2569_c7_6b1f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2580_c11_f525] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_left;
     BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output := BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2554_c11_4c29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_left;
     BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output := BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2582_c21_72bc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2575_c32_c867_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c6_15f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2546_c11_d6ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2549_c11_3b8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2554_c11_4c29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2557_c11_9031_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_d1bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_077f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_6f43_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2572_c11_d1bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2580_c11_f525_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2585_c11_9742_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2582_c3_74a9 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2582_c21_72bc_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2573_l2550_l2558_l2565_DUPLICATE_11c2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2573_l2550_l2558_l2565_DUPLICATE_11c2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2573_l2550_l2558_l2565_DUPLICATE_11c2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2583_c22_1980_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2549_DUPLICATE_146d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_96f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2572_l2546_l2569_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_9459_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2585_l2554_l2580_l2549_DUPLICATE_e53b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2ccb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2546_l2569_l2541_l2564_l2561_l2557_l2554_l2580_l2549_DUPLICATE_2a00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2569_c7_6b1f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2582_c3_74a9;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2569_c7_6b1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2573_c3_ad24] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_left;
     BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_return_output := BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2580_c7_5dbc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2585_c7_e16b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2585_c7_e16b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2575_c32_b974] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_left;
     BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_return_output := BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2558_c3_f99a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_left;
     BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_return_output := BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2580_c7_5dbc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2541_c1_2578] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2580_c7_5dbc] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output := result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2575_c32_b974_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2558_c3_f99a_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2573_c3_ad24_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2551_l2566_DUPLICATE_2118_return_output;
     VAR_printf_uxn_opcodes_h_l2542_c3_7c6d_uxn_opcodes_h_l2542_c3_7c6d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2541_c1_2578_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2585_c7_e16b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2580_c7_5dbc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;

     -- MUX[uxn_opcodes_h_l2575_c32_c1df] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2575_c32_c1df_cond <= VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_cond;
     MUX_uxn_opcodes_h_l2575_c32_c1df_iftrue <= VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_iftrue;
     MUX_uxn_opcodes_h_l2575_c32_c1df_iffalse <= VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_return_output := MUX_uxn_opcodes_h_l2575_c32_c1df_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2572_c7_48b5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;

     -- printf_uxn_opcodes_h_l2542_c3_7c6d[uxn_opcodes_h_l2542_c3_7c6d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2542_c3_7c6d_uxn_opcodes_h_l2542_c3_7c6d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2542_c3_7c6d_uxn_opcodes_h_l2542_c3_7c6d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2572_c7_48b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2557_c7_a562] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2557_c7_a562_cond <= VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_cond;
     t16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue;
     t16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output := t16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;

     -- n16_MUX[uxn_opcodes_h_l2572_c7_48b5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2572_c7_48b5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_cond;
     n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue;
     n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output := n16_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2578_c32_27e9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_return_output := CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_f901] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2580_c7_5dbc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue := VAR_MUX_uxn_opcodes_h_l2575_c32_c1df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2580_c7_5dbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2572_c7_48b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_d9b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2569_c7_6b1f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2572_c7_48b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2554_c7_98cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond;
     t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue;
     t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output := t16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2578_c22_5871] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2578_c22_5871_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2578_c32_27e9_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2572_c7_48b5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2569_c7_6b1f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2569_c7_6b1f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond;
     n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue;
     n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output := n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2578_c22_5871_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2564_c7_f901] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2569_c7_6b1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2564_c7_f901] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2569_c7_6b1f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2549_c7_7133] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2549_c7_7133_cond <= VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_cond;
     t16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue;
     t16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output := t16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2557_c7_a562] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;

     -- n16_MUX[uxn_opcodes_h_l2564_c7_f901] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2564_c7_f901_cond <= VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_cond;
     n16_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue;
     n16_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_return_output := n16_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2569_c7_6b1f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2572_c7_48b5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output := result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2572_c7_48b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_f901] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;

     -- n16_MUX[uxn_opcodes_h_l2561_c7_d9b5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond;
     n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue;
     n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output := n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2554_c7_98cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_f901] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2561_c7_d9b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2561_c7_d9b5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2564_c7_f901] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2569_c7_6b1f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output := result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2546_c7_d1e7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond;
     t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue;
     t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output := t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2569_c7_6b1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_d9b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2561_c7_d9b5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2549_c7_7133] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;

     -- t16_MUX[uxn_opcodes_h_l2541_c2_54af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2541_c2_54af_cond <= VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_cond;
     t16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue;
     t16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output := t16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_d9b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2557_c7_a562] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2564_c7_f901] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_return_output := result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;

     -- n16_MUX[uxn_opcodes_h_l2557_c7_a562] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2557_c7_a562_cond <= VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_cond;
     n16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue;
     n16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output := n16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2557_c7_a562] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2564_c7_f901_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;
     -- n16_MUX[uxn_opcodes_h_l2554_c7_98cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_cond;
     n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue;
     n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output := n16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2557_c7_a562] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2546_c7_d1e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2554_c7_98cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2561_c7_d9b5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output := result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2557_c7_a562] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2557_c7_a562] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2554_c7_98cb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_d9b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2549_c7_7133] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2549_c7_7133] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2557_c7_a562] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_return_output := result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2554_c7_98cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l2549_c7_7133] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2549_c7_7133_cond <= VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_cond;
     n16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue;
     n16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output := n16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2554_c7_98cb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2541_c2_54af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2554_c7_98cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2557_c7_a562_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2549_c7_7133] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2549_c7_7133] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2546_c7_d1e7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2554_c7_98cb] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output := result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2546_c7_d1e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2549_c7_7133] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;

     -- n16_MUX[uxn_opcodes_h_l2546_c7_d1e7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond;
     n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue;
     n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output := n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2554_c7_98cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2549_c7_7133] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_return_output := result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2541_c2_54af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2546_c7_d1e7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2546_c7_d1e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2541_c2_54af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2541_c2_54af_cond <= VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_cond;
     n16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue;
     n16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output := n16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2541_c2_54af] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2546_c7_d1e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2549_c7_7133_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2541_c2_54af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2541_c2_54af] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2546_c7_d1e7] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output := result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2541_c2_54af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;

     -- Submodule level 12
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2546_c7_d1e7_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2541_c2_54af] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_return_output := result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2590_l2537_DUPLICATE_a688 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2590_l2537_DUPLICATE_a688_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2541_c2_54af_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2541_c2_54af_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2590_l2537_DUPLICATE_a688_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l2590_l2537_DUPLICATE_a688_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
