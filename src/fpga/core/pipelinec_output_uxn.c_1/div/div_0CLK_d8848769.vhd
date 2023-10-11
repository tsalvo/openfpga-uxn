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
entity div_0CLK_d8848769 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div_0CLK_d8848769;
architecture arch of div_0CLK_d8848769 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2236_c6_a22e]
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2236_c1_2feb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2236_c2_96b1]
signal n8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2236_c2_96b1]
signal t8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c2_96b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2236_c2_96b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2236_c2_96b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2236_c2_96b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2236_c2_96b1]
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c2_96b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2237_c3_f9f7[uxn_opcodes_h_l2237_c3_f9f7]
signal printf_uxn_opcodes_h_l2237_c3_f9f7_uxn_opcodes_h_l2237_c3_f9f7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2241_c11_032b]
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2241_c7_eb8a]
signal n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2241_c7_eb8a]
signal t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2241_c7_eb8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2241_c7_eb8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2241_c7_eb8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2241_c7_eb8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2241_c7_eb8a]
signal result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2241_c7_eb8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_1e11]
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2244_c7_47f3]
signal n8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2244_c7_47f3]
signal t8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_47f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_47f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_47f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_47f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2244_c7_47f3]
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_47f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2248_c11_5a25]
signal BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2248_c7_de51]
signal n8_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2248_c7_de51]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2248_c7_de51]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2248_c7_de51]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2248_c7_de51]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2248_c7_de51]
signal result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2248_c7_de51]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2251_c11_ec22]
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2251_c7_adef]
signal n8_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c7_adef]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2251_c7_adef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c7_adef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c7_adef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2251_c7_adef]
signal result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c7_adef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2254_c32_1e51]
signal BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2254_c32_2e7f]
signal BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2254_c32_a1a4]
signal MUX_uxn_opcodes_h_l2254_c32_a1a4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2254_c32_a1a4_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2254_c32_a1a4_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2254_c32_a1a4_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2256_c11_a928]
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2256_c7_2c2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2256_c7_2c2d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2256_c7_2c2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2256_c7_2c2d]
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2256_c7_2c2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2260_c24_521a]
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2260_c38_070e]
signal BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_left : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_right : unsigned(7 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_return_output : unsigned(7 downto 0);

-- MUX[uxn_opcodes_h_l2260_c24_0e97]
signal MUX_uxn_opcodes_h_l2260_c24_0e97_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2260_c24_0e97_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2260_c24_0e97_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2260_c24_0e97_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2262_c11_6100]
signal BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2262_c7_782f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2262_c7_782f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_left,
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_right,
BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_return_output);

-- n8_MUX_uxn_opcodes_h_l2236_c2_96b1
n8_MUX_uxn_opcodes_h_l2236_c2_96b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond,
n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue,
n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse,
n8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output);

-- t8_MUX_uxn_opcodes_h_l2236_c2_96b1
t8_MUX_uxn_opcodes_h_l2236_c2_96b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond,
t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue,
t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse,
t8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output);

-- printf_uxn_opcodes_h_l2237_c3_f9f7_uxn_opcodes_h_l2237_c3_f9f7
printf_uxn_opcodes_h_l2237_c3_f9f7_uxn_opcodes_h_l2237_c3_f9f7 : entity work.printf_uxn_opcodes_h_l2237_c3_f9f7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2237_c3_f9f7_uxn_opcodes_h_l2237_c3_f9f7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_left,
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_right,
BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output);

-- n8_MUX_uxn_opcodes_h_l2241_c7_eb8a
n8_MUX_uxn_opcodes_h_l2241_c7_eb8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond,
n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue,
n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse,
n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output);

-- t8_MUX_uxn_opcodes_h_l2241_c7_eb8a
t8_MUX_uxn_opcodes_h_l2241_c7_eb8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond,
t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue,
t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse,
t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_left,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_right,
BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output);

-- n8_MUX_uxn_opcodes_h_l2244_c7_47f3
n8_MUX_uxn_opcodes_h_l2244_c7_47f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond,
n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue,
n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse,
n8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output);

-- t8_MUX_uxn_opcodes_h_l2244_c7_47f3
t8_MUX_uxn_opcodes_h_l2244_c7_47f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond,
t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue,
t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse,
t8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_left,
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_right,
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output);

-- n8_MUX_uxn_opcodes_h_l2248_c7_de51
n8_MUX_uxn_opcodes_h_l2248_c7_de51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2248_c7_de51_cond,
n8_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue,
n8_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse,
n8_MUX_uxn_opcodes_h_l2248_c7_de51_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_cond,
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_left,
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_right,
BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output);

-- n8_MUX_uxn_opcodes_h_l2251_c7_adef
n8_MUX_uxn_opcodes_h_l2251_c7_adef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2251_c7_adef_cond,
n8_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue,
n8_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse,
n8_MUX_uxn_opcodes_h_l2251_c7_adef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_cond,
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51
BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_left,
BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_right,
BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f
BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_left,
BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_right,
BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_return_output);

-- MUX_uxn_opcodes_h_l2254_c32_a1a4
MUX_uxn_opcodes_h_l2254_c32_a1a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2254_c32_a1a4_cond,
MUX_uxn_opcodes_h_l2254_c32_a1a4_iftrue,
MUX_uxn_opcodes_h_l2254_c32_a1a4_iffalse,
MUX_uxn_opcodes_h_l2254_c32_a1a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_left,
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_right,
BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a
BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_left,
BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_right,
BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e
BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e : entity work.BIN_OP_DIV_uint8_t_uint8_t_0CLK_a148083c port map (
BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_left,
BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_right,
BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_return_output);

-- MUX_uxn_opcodes_h_l2260_c24_0e97
MUX_uxn_opcodes_h_l2260_c24_0e97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2260_c24_0e97_cond,
MUX_uxn_opcodes_h_l2260_c24_0e97_iftrue,
MUX_uxn_opcodes_h_l2260_c24_0e97_iffalse,
MUX_uxn_opcodes_h_l2260_c24_0e97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_left,
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_right,
BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_return_output,
 n8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
 t8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output,
 n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output,
 t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output,
 n8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output,
 t8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output,
 n8_MUX_uxn_opcodes_h_l2248_c7_de51_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output,
 n8_MUX_uxn_opcodes_h_l2251_c7_adef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_return_output,
 MUX_uxn_opcodes_h_l2254_c32_a1a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_return_output,
 MUX_uxn_opcodes_h_l2260_c24_0e97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_476a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2237_c3_f9f7_uxn_opcodes_h_l2237_c3_f9f7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_4bd4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2246_c3_aa3a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2249_c3_958c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2259_c3_8978 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2236_l2262_l2251_l2248_l2244_l2241_DUPLICATE_7501_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2236_l2256_l2248_l2244_l2241_DUPLICATE_3231_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2236_l2251_l2248_l2244_l2241_DUPLICATE_3108_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2236_l2256_l2251_l2248_l2244_l2241_DUPLICATE_823f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2262_l2256_l2251_l2248_l2244_l2241_DUPLICATE_d4ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2256_l2251_DUPLICATE_2fc0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2267_l2232_DUPLICATE_b793_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2259_c3_8978 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2259_c3_8978;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_4bd4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_4bd4;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2246_c3_aa3a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2246_c3_aa3a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_476a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2238_c3_476a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2249_c3_958c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2249_c3_958c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_left := VAR_ins;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_right := t8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2236_l2256_l2251_l2248_l2244_l2241_DUPLICATE_823f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2236_l2256_l2251_l2248_l2244_l2241_DUPLICATE_823f_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2256_l2251_DUPLICATE_2fc0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2256_l2251_DUPLICATE_2fc0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2241_c11_032b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2260_c24_521a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2236_l2262_l2251_l2248_l2244_l2241_DUPLICATE_7501 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2236_l2262_l2251_l2248_l2244_l2241_DUPLICATE_7501_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2262_c11_6100] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_left;
     BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_return_output := BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2254_c32_1e51] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_left;
     BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_return_output := BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2236_c6_a22e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2256_c11_a928] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_left;
     BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output := BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2262_l2256_l2251_l2248_l2244_l2241_DUPLICATE_d4ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2262_l2256_l2251_l2248_l2244_l2241_DUPLICATE_d4ba_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2244_c11_1e11] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_left;
     BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output := BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2236_l2251_l2248_l2244_l2241_DUPLICATE_3108 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2236_l2251_l2248_l2244_l2241_DUPLICATE_3108_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2236_l2256_l2248_l2244_l2241_DUPLICATE_3231 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2236_l2256_l2248_l2244_l2241_DUPLICATE_3231_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2248_c11_5a25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_left;
     BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output := BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2260_c38_070e] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_left;
     BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_return_output := BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2251_c11_ec22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_left;
     BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output := BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2254_c32_1e51_return_output;
     VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2260_c38_070e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2236_c6_a22e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2241_c11_032b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2244_c11_1e11_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_5a25_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2251_c11_ec22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2256_c11_a928_return_output;
     VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2260_c24_521a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2262_c11_6100_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2236_l2251_l2248_l2244_l2241_DUPLICATE_3108_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2236_l2251_l2248_l2244_l2241_DUPLICATE_3108_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2236_l2251_l2248_l2244_l2241_DUPLICATE_3108_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2236_l2251_l2248_l2244_l2241_DUPLICATE_3108_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2236_l2251_l2248_l2244_l2241_DUPLICATE_3108_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2262_l2256_l2251_l2248_l2244_l2241_DUPLICATE_d4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2262_l2256_l2251_l2248_l2244_l2241_DUPLICATE_d4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2262_l2256_l2251_l2248_l2244_l2241_DUPLICATE_d4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2262_l2256_l2251_l2248_l2244_l2241_DUPLICATE_d4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2262_l2256_l2251_l2248_l2244_l2241_DUPLICATE_d4ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2262_l2256_l2251_l2248_l2244_l2241_DUPLICATE_d4ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2236_l2256_l2248_l2244_l2241_DUPLICATE_3231_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2236_l2256_l2248_l2244_l2241_DUPLICATE_3231_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2236_l2256_l2248_l2244_l2241_DUPLICATE_3231_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2236_l2256_l2248_l2244_l2241_DUPLICATE_3231_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2236_l2256_l2248_l2244_l2241_DUPLICATE_3231_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2236_l2262_l2251_l2248_l2244_l2241_DUPLICATE_7501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2236_l2262_l2251_l2248_l2244_l2241_DUPLICATE_7501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2236_l2262_l2251_l2248_l2244_l2241_DUPLICATE_7501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2236_l2262_l2251_l2248_l2244_l2241_DUPLICATE_7501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2236_l2262_l2251_l2248_l2244_l2241_DUPLICATE_7501_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2236_l2262_l2251_l2248_l2244_l2241_DUPLICATE_7501_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2256_l2251_DUPLICATE_2fc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2256_l2251_DUPLICATE_2fc0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2236_l2256_l2251_l2248_l2244_l2241_DUPLICATE_823f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2236_l2256_l2251_l2248_l2244_l2241_DUPLICATE_823f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2236_l2256_l2251_l2248_l2244_l2241_DUPLICATE_823f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2236_l2256_l2251_l2248_l2244_l2241_DUPLICATE_823f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2236_l2256_l2251_l2248_l2244_l2241_DUPLICATE_823f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2236_l2256_l2251_l2248_l2244_l2241_DUPLICATE_823f_return_output;
     -- t8_MUX[uxn_opcodes_h_l2244_c7_47f3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond <= VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond;
     t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue;
     t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output := t8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2251_c7_adef] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2251_c7_adef_cond <= VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_cond;
     n8_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue;
     n8_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_return_output := n8_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2262_c7_782f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2256_c7_2c2d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2262_c7_782f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2256_c7_2c2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2254_c32_2e7f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_left;
     BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_return_output := BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2236_c1_2feb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_return_output;

     -- MUX[uxn_opcodes_h_l2260_c24_0e97] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2260_c24_0e97_cond <= VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_cond;
     MUX_uxn_opcodes_h_l2260_c24_0e97_iftrue <= VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_iftrue;
     MUX_uxn_opcodes_h_l2260_c24_0e97_iffalse <= VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_return_output := MUX_uxn_opcodes_h_l2260_c24_0e97_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2254_c32_2e7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue := VAR_MUX_uxn_opcodes_h_l2260_c24_0e97_return_output;
     VAR_printf_uxn_opcodes_h_l2237_c3_f9f7_uxn_opcodes_h_l2237_c3_f9f7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2236_c1_2feb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2262_c7_782f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2262_c7_782f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;
     -- MUX[uxn_opcodes_h_l2254_c32_a1a4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2254_c32_a1a4_cond <= VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_cond;
     MUX_uxn_opcodes_h_l2254_c32_a1a4_iftrue <= VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_iftrue;
     MUX_uxn_opcodes_h_l2254_c32_a1a4_iffalse <= VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_return_output := MUX_uxn_opcodes_h_l2254_c32_a1a4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2256_c7_2c2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2248_c7_de51] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2248_c7_de51_cond <= VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_cond;
     n8_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue;
     n8_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_return_output := n8_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2251_c7_adef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2256_c7_2c2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2251_c7_adef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;

     -- t8_MUX[uxn_opcodes_h_l2241_c7_eb8a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond;
     t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue;
     t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output := t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2256_c7_2c2d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;

     -- printf_uxn_opcodes_h_l2237_c3_f9f7[uxn_opcodes_h_l2237_c3_f9f7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2237_c3_f9f7_uxn_opcodes_h_l2237_c3_f9f7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2237_c3_f9f7_uxn_opcodes_h_l2237_c3_f9f7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue := VAR_MUX_uxn_opcodes_h_l2254_c32_a1a4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2256_c7_2c2d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2251_c7_adef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;

     -- t8_MUX[uxn_opcodes_h_l2236_c2_96b1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond <= VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond;
     t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue;
     t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output := t8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2248_c7_de51] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2251_c7_adef] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;

     -- n8_MUX[uxn_opcodes_h_l2244_c7_47f3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond <= VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_cond;
     n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue;
     n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output := n8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2251_c7_adef] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_return_output := result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2251_c7_adef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2248_c7_de51] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2251_c7_adef_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2248_c7_de51] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2244_c7_47f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2248_c7_de51] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2248_c7_de51] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_return_output := result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;

     -- n8_MUX[uxn_opcodes_h_l2241_c7_eb8a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond;
     n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue;
     n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output := n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2248_c7_de51] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2244_c7_47f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2248_c7_de51_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2244_c7_47f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2241_c7_eb8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2244_c7_47f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2244_c7_47f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2236_c2_96b1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_cond;
     n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue;
     n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output := n8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2244_c7_47f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2241_c7_eb8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2244_c7_47f3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2236_c2_96b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2241_c7_eb8a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2241_c7_eb8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2241_c7_eb8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2236_c2_96b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2241_c7_eb8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2241_c7_eb8a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2236_c2_96b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2236_c2_96b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2236_c2_96b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2236_c2_96b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2267_l2232_DUPLICATE_b793 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2267_l2232_DUPLICATE_b793_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2236_c2_96b1_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2267_l2232_DUPLICATE_b793_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2267_l2232_DUPLICATE_b793_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
