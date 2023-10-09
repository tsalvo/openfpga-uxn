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
-- Submodules: 71
entity nip2_0CLK_50a1b8d0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip2_0CLK_50a1b8d0;
architecture arch of nip2_0CLK_50a1b8d0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2482_c6_85c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2482_c1_07c5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2482_c2_d5cf]
signal t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2482_c2_d5cf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2482_c2_d5cf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2482_c2_d5cf]
signal result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2482_c2_d5cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2482_c2_d5cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2482_c2_d5cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2482_c2_d5cf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2483_c3_5464[uxn_opcodes_h_l2483_c3_5464]
signal printf_uxn_opcodes_h_l2483_c3_5464_uxn_opcodes_h_l2483_c3_5464_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2488_c11_803a]
signal BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2488_c7_de05]
signal t16_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2488_c7_de05]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2488_c7_de05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2488_c7_de05]
signal result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2488_c7_de05]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2488_c7_de05]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2488_c7_de05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2488_c7_de05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2491_c11_5ba5]
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2491_c7_747e]
signal t16_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2491_c7_747e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2491_c7_747e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2491_c7_747e]
signal result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2491_c7_747e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2491_c7_747e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2491_c7_747e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2491_c7_747e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2493_c3_8449]
signal CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2496_c11_599a]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c7_fc0d]
signal t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2496_c7_fc0d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c7_fc0d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2496_c7_fc0d]
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2496_c7_fc0d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c7_fc0d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c7_fc0d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c7_fc0d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2499_c11_3b5f]
signal BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2499_c7_d52a]
signal t16_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2499_c7_d52a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2499_c7_d52a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2499_c7_d52a]
signal result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2499_c7_d52a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2499_c7_d52a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2499_c7_d52a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2499_c7_d52a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2500_c3_bda9]
signal BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2503_c32_3338]
signal BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2503_c32_0cb1]
signal BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2503_c32_c1cc]
signal MUX_uxn_opcodes_h_l2503_c32_c1cc_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2503_c32_c1cc_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2503_c32_c1cc_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2503_c32_c1cc_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_a006]
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_d1b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2505_c7_d1b7]
signal result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c7_d1b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_d1b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_d1b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2511_c11_d6e6]
signal BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2511_c7_24c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2511_c7_24c3]
signal result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2511_c7_24c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2511_c7_24c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2513_c34_b79b]
signal CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2515_c11_142b]
signal BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2515_c7_c5f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2515_c7_c5f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3
BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_return_output);

-- t16_MUX_uxn_opcodes_h_l2482_c2_d5cf
t16_MUX_uxn_opcodes_h_l2482_c2_d5cf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond,
t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue,
t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse,
t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf
result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf
result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf
result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output);

-- printf_uxn_opcodes_h_l2483_c3_5464_uxn_opcodes_h_l2483_c3_5464
printf_uxn_opcodes_h_l2483_c3_5464_uxn_opcodes_h_l2483_c3_5464 : entity work.printf_uxn_opcodes_h_l2483_c3_5464_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2483_c3_5464_uxn_opcodes_h_l2483_c3_5464_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a
BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_left,
BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_right,
BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output);

-- t16_MUX_uxn_opcodes_h_l2488_c7_de05
t16_MUX_uxn_opcodes_h_l2488_c7_de05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2488_c7_de05_cond,
t16_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue,
t16_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse,
t16_MUX_uxn_opcodes_h_l2488_c7_de05_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05
result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05
result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05
result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_cond,
result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05
result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05
result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05
result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_left,
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_right,
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output);

-- t16_MUX_uxn_opcodes_h_l2491_c7_747e
t16_MUX_uxn_opcodes_h_l2491_c7_747e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2491_c7_747e_cond,
t16_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue,
t16_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse,
t16_MUX_uxn_opcodes_h_l2491_c7_747e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e
result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e
result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2493_c3_8449
CONST_SL_8_uxn_opcodes_h_l2493_c3_8449 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_x,
CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c7_fc0d
t16_MUX_uxn_opcodes_h_l2496_c7_fc0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond,
t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_left,
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_right,
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output);

-- t16_MUX_uxn_opcodes_h_l2499_c7_d52a
t16_MUX_uxn_opcodes_h_l2499_c7_d52a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2499_c7_d52a_cond,
t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue,
t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse,
t16_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9
BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_left,
BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_right,
BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338
BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_left,
BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_right,
BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1
BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_left,
BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_right,
BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_return_output);

-- MUX_uxn_opcodes_h_l2503_c32_c1cc
MUX_uxn_opcodes_h_l2503_c32_c1cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2503_c32_c1cc_cond,
MUX_uxn_opcodes_h_l2503_c32_c1cc_iftrue,
MUX_uxn_opcodes_h_l2503_c32_c1cc_iffalse,
MUX_uxn_opcodes_h_l2503_c32_c1cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_left,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_right,
BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_left,
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_right,
BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b
CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_x,
CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b
BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_left,
BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_right,
BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0
result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_return_output,
 t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output,
 t16_MUX_uxn_opcodes_h_l2488_c7_de05_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output,
 t16_MUX_uxn_opcodes_h_l2491_c7_747e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_return_output,
 CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output,
 t16_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_return_output,
 MUX_uxn_opcodes_h_l2503_c32_c1cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output,
 CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2485_c3_ab52 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2483_c3_5464_uxn_opcodes_h_l2483_c3_5464_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2489_c3_4c17 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2494_c3_9c56 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2497_c3_a3dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2508_c3_752a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2509_c24_a348_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_9e68 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2513_c24_2d7e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_DUPLICATE_5680_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_l2511_DUPLICATE_2ab0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2505_l2496_l2491_l2488_l2482_DUPLICATE_9cc8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2499_l2491_l2496_l2488_DUPLICATE_c89e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2492_l2500_DUPLICATE_1dcd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2499_l2511_DUPLICATE_a93d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2520_l2478_DUPLICATE_a537_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2508_c3_752a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2508_c3_752a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2497_c3_a3dc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2497_c3_a3dc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2494_c3_9c56 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2494_c3_9c56;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2489_c3_4c17 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2489_c3_4c17;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2485_c3_ab52 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2485_c3_ab52;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_9e68 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_9e68;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2491_c11_5ba5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2505_c11_a006] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_left;
     BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output := BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2499_l2491_l2496_l2488_DUPLICATE_c89e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2499_l2491_l2496_l2488_DUPLICATE_c89e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2499_c11_3b5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2511_c11_d6e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c11_599a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2499_l2511_DUPLICATE_a93d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2499_l2511_DUPLICATE_a93d_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2492_l2500_DUPLICATE_1dcd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2492_l2500_DUPLICATE_1dcd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2482_c6_85c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2488_c11_803a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_l2511_DUPLICATE_2ab0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_l2511_DUPLICATE_2ab0_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2503_c32_3338] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_left;
     BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_return_output := BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_DUPLICATE_5680 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_DUPLICATE_5680_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2505_l2496_l2491_l2488_l2482_DUPLICATE_9cc8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2505_l2496_l2491_l2488_l2482_DUPLICATE_9cc8_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2509_c24_a348] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2509_c24_a348_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2515_c11_142b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2513_c34_b79b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_return_output := CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2503_c32_3338_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2482_c6_85c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2488_c11_803a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_5ba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c11_599a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_3b5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2505_c11_a006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2511_c11_d6e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2515_c11_142b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2492_l2500_DUPLICATE_1dcd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2492_l2500_DUPLICATE_1dcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2509_c24_a348_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_DUPLICATE_5680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_DUPLICATE_5680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_DUPLICATE_5680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_DUPLICATE_5680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_DUPLICATE_5680_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2505_l2499_l2496_l2491_l2488_l2515_l2511_DUPLICATE_4cb2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2505_l2496_l2491_l2488_l2482_DUPLICATE_9cc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2505_l2496_l2491_l2488_l2482_DUPLICATE_9cc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2505_l2496_l2491_l2488_l2482_DUPLICATE_9cc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2505_l2496_l2491_l2488_l2482_DUPLICATE_9cc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2505_l2496_l2491_l2488_l2482_DUPLICATE_9cc8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2499_l2491_l2496_l2488_DUPLICATE_c89e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2499_l2491_l2496_l2488_DUPLICATE_c89e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2499_l2491_l2496_l2488_DUPLICATE_c89e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2499_l2491_l2496_l2488_DUPLICATE_c89e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2515_l2482_l2511_DUPLICATE_9c7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2499_l2511_DUPLICATE_a93d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2499_l2511_DUPLICATE_a93d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_l2511_DUPLICATE_2ab0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_l2511_DUPLICATE_2ab0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_l2511_DUPLICATE_2ab0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_l2511_DUPLICATE_2ab0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_l2511_DUPLICATE_2ab0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2499_l2496_l2491_l2488_l2482_l2511_DUPLICATE_2ab0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2505_c7_d1b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2482_c1_07c5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2503_c32_0cb1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_left;
     BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_return_output := BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2515_c7_c5f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2500_c3_bda9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_left;
     BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_return_output := BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2499_c7_d52a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2515_c7_c5f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2511_c7_24c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2513_c24_2d7e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2513_c24_2d7e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2513_c34_b79b_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l2493_c3_8449] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_return_output := CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2503_c32_0cb1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2500_c3_bda9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2513_c24_2d7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2493_c3_8449_return_output;
     VAR_printf_uxn_opcodes_h_l2483_c3_5464_uxn_opcodes_h_l2483_c3_5464_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2482_c1_07c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2515_c7_c5f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output;
     -- MUX[uxn_opcodes_h_l2503_c32_c1cc] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2503_c32_c1cc_cond <= VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_cond;
     MUX_uxn_opcodes_h_l2503_c32_c1cc_iftrue <= VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_iftrue;
     MUX_uxn_opcodes_h_l2503_c32_c1cc_iffalse <= VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_return_output := MUX_uxn_opcodes_h_l2503_c32_c1cc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2511_c7_24c3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output;

     -- printf_uxn_opcodes_h_l2483_c3_5464[uxn_opcodes_h_l2483_c3_5464] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2483_c3_5464_uxn_opcodes_h_l2483_c3_5464_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2483_c3_5464_uxn_opcodes_h_l2483_c3_5464_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2499_c7_d52a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2511_c7_24c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2499_c7_d52a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2499_c7_d52a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_cond;
     t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue;
     t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output := t16_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2511_c7_24c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2496_c7_fc0d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2505_c7_d1b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue := VAR_MUX_uxn_opcodes_h_l2503_c32_c1cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2511_c7_24c3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2499_c7_d52a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2505_c7_d1b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2499_c7_d52a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2491_c7_747e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2496_c7_fc0d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2505_c7_d1b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2496_c7_fc0d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond;
     t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output := t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2505_c7_d1b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2505_c7_d1b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2491_c7_747e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2499_c7_d52a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2488_c7_de05] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;

     -- t16_MUX[uxn_opcodes_h_l2491_c7_747e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2491_c7_747e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_cond;
     t16_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue;
     t16_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_return_output := t16_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2499_c7_d52a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c7_fc0d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c7_fc0d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2499_c7_d52a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2499_c7_d52a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2491_c7_747e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2491_c7_747e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2488_c7_de05] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;

     -- t16_MUX[uxn_opcodes_h_l2488_c7_de05] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2488_c7_de05_cond <= VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_cond;
     t16_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue;
     t16_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_return_output := t16_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c7_fc0d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c7_fc0d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2496_c7_fc0d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2482_c2_d5cf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2496_c7_fc0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2491_c7_747e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2491_c7_747e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2488_c7_de05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2488_c7_de05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2482_c2_d5cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output;

     -- t16_MUX[uxn_opcodes_h_l2482_c2_d5cf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond <= VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond;
     t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue;
     t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output := t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2491_c7_747e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2491_c7_747e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2488_c7_de05] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_return_output := result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2482_c2_d5cf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2488_c7_de05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2482_c2_d5cf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2488_c7_de05] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2488_c7_de05_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2482_c2_d5cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2482_c2_d5cf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2482_c2_d5cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2520_l2478_DUPLICATE_a537 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2520_l2478_DUPLICATE_a537_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2482_c2_d5cf_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2520_l2478_DUPLICATE_a537_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2520_l2478_DUPLICATE_a537_return_output;
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
