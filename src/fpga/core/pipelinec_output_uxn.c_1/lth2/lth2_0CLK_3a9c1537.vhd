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
-- Submodules: 107
entity lth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_3a9c1537;
architecture arch of lth2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2167_c6_17d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2167_c1_5e55]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2167_c2_131a]
signal n16_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2167_c2_131a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2167_c2_131a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2167_c2_131a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2167_c2_131a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2167_c2_131a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2167_c2_131a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2167_c2_131a]
signal result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2167_c2_131a]
signal t16_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2168_c3_7729[uxn_opcodes_h_l2168_c3_7729]
signal printf_uxn_opcodes_h_l2168_c3_7729_uxn_opcodes_h_l2168_c3_7729_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_9ebf]
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2173_c7_6ff5]
signal n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c7_6ff5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2173_c7_6ff5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2173_c7_6ff5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_6ff5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_6ff5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_6ff5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2173_c7_6ff5]
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2173_c7_6ff5]
signal t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2176_c11_5d73]
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2176_c7_c480]
signal n16_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c7_c480]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2176_c7_c480]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c7_c480]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2176_c7_c480]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c7_c480]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c7_c480]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2176_c7_c480]
signal result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2176_c7_c480]
signal t16_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_d260]
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2181_c7_3273]
signal n16_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_3273]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2181_c7_3273]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_3273]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2181_c7_3273]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_3273]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_3273]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2181_c7_3273]
signal result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2181_c7_3273]
signal t16_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_7689]
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2184_c7_7941]
signal n16_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_7941]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2184_c7_7941]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_7941]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2184_c7_7941]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_7941]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_7941]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2184_c7_7941]
signal result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2184_c7_7941]
signal t16_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2185_c3_68a5]
signal BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2188_c11_778f]
signal BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2188_c7_ab71]
signal n16_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2188_c7_ab71]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2188_c7_ab71]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2188_c7_ab71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2188_c7_ab71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2188_c7_ab71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2188_c7_ab71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2188_c7_ab71]
signal result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2191_c11_8b61]
signal BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2191_c7_b197]
signal n16_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2191_c7_b197]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2191_c7_b197]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2191_c7_b197]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2191_c7_b197]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2191_c7_b197]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2191_c7_b197]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2191_c7_b197]
signal result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2196_c11_3f3c]
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2196_c7_811a]
signal n16_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2196_c7_811a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2196_c7_811a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2196_c7_811a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2196_c7_811a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2196_c7_811a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2196_c7_811a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2196_c7_811a]
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2199_c11_6163]
signal BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2199_c7_7a0a]
signal n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2199_c7_7a0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2199_c7_7a0a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2199_c7_7a0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2199_c7_7a0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2199_c7_7a0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2199_c7_7a0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2199_c7_7a0a]
signal result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2200_c3_55d1]
signal BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2203_c32_360a]
signal BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2203_c32_b65a]
signal BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2203_c32_693c]
signal MUX_uxn_opcodes_h_l2203_c32_693c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2203_c32_693c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2203_c32_693c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2203_c32_693c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_c1b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_3c36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_3c36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_3c36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_3c36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_3c36]
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2209_c24_97f8]
signal BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2209_c24_7901]
signal MUX_uxn_opcodes_h_l2209_c24_7901_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2209_c24_7901_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2209_c24_7901_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2209_c24_7901_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2211_c11_11ed]
signal BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2211_c7_c28d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2211_c7_c28d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8
BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_return_output);

-- n16_MUX_uxn_opcodes_h_l2167_c2_131a
n16_MUX_uxn_opcodes_h_l2167_c2_131a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2167_c2_131a_cond,
n16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue,
n16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse,
n16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a
result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

-- t16_MUX_uxn_opcodes_h_l2167_c2_131a
t16_MUX_uxn_opcodes_h_l2167_c2_131a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2167_c2_131a_cond,
t16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue,
t16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse,
t16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

-- printf_uxn_opcodes_h_l2168_c3_7729_uxn_opcodes_h_l2168_c3_7729
printf_uxn_opcodes_h_l2168_c3_7729_uxn_opcodes_h_l2168_c3_7729 : entity work.printf_uxn_opcodes_h_l2168_c3_7729_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2168_c3_7729_uxn_opcodes_h_l2168_c3_7729_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_left,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_right,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output);

-- n16_MUX_uxn_opcodes_h_l2173_c7_6ff5
n16_MUX_uxn_opcodes_h_l2173_c7_6ff5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond,
n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue,
n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse,
n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5
result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output);

-- t16_MUX_uxn_opcodes_h_l2173_c7_6ff5
t16_MUX_uxn_opcodes_h_l2173_c7_6ff5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond,
t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue,
t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse,
t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_left,
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_right,
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output);

-- n16_MUX_uxn_opcodes_h_l2176_c7_c480
n16_MUX_uxn_opcodes_h_l2176_c7_c480 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2176_c7_c480_cond,
n16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue,
n16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse,
n16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480
result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480
result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_cond,
result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_return_output);

-- t16_MUX_uxn_opcodes_h_l2176_c7_c480
t16_MUX_uxn_opcodes_h_l2176_c7_c480 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2176_c7_c480_cond,
t16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue,
t16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse,
t16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_left,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_right,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output);

-- n16_MUX_uxn_opcodes_h_l2181_c7_3273
n16_MUX_uxn_opcodes_h_l2181_c7_3273 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2181_c7_3273_cond,
n16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue,
n16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse,
n16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273
result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_cond,
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_return_output);

-- t16_MUX_uxn_opcodes_h_l2181_c7_3273
t16_MUX_uxn_opcodes_h_l2181_c7_3273 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2181_c7_3273_cond,
t16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue,
t16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse,
t16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_left,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_right,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output);

-- n16_MUX_uxn_opcodes_h_l2184_c7_7941
n16_MUX_uxn_opcodes_h_l2184_c7_7941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2184_c7_7941_cond,
n16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue,
n16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse,
n16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941
result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941
result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_cond,
result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_return_output);

-- t16_MUX_uxn_opcodes_h_l2184_c7_7941
t16_MUX_uxn_opcodes_h_l2184_c7_7941 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2184_c7_7941_cond,
t16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue,
t16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse,
t16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5
BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_left,
BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_right,
BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f
BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_left,
BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_right,
BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output);

-- n16_MUX_uxn_opcodes_h_l2188_c7_ab71
n16_MUX_uxn_opcodes_h_l2188_c7_ab71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2188_c7_ab71_cond,
n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue,
n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse,
n16_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71
result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71
result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71
result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71
result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71
result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71
result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_cond,
result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61
BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_left,
BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_right,
BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output);

-- n16_MUX_uxn_opcodes_h_l2191_c7_b197
n16_MUX_uxn_opcodes_h_l2191_c7_b197 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2191_c7_b197_cond,
n16_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue,
n16_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse,
n16_MUX_uxn_opcodes_h_l2191_c7_b197_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197
result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_cond,
result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_left,
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_right,
BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output);

-- n16_MUX_uxn_opcodes_h_l2196_c7_811a
n16_MUX_uxn_opcodes_h_l2196_c7_811a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2196_c7_811a_cond,
n16_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue,
n16_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse,
n16_MUX_uxn_opcodes_h_l2196_c7_811a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163
BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_left,
BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_right,
BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output);

-- n16_MUX_uxn_opcodes_h_l2199_c7_7a0a
n16_MUX_uxn_opcodes_h_l2199_c7_7a0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond,
n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue,
n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse,
n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a
result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a
result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1
BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_left,
BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_right,
BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a
BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_left,
BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_right,
BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a
BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_left,
BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_right,
BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_return_output);

-- MUX_uxn_opcodes_h_l2203_c32_693c
MUX_uxn_opcodes_h_l2203_c32_693c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2203_c32_693c_cond,
MUX_uxn_opcodes_h_l2203_c32_693c_iftrue,
MUX_uxn_opcodes_h_l2203_c32_693c_iffalse,
MUX_uxn_opcodes_h_l2203_c32_693c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_cond,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8
BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_left,
BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_right,
BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_return_output);

-- MUX_uxn_opcodes_h_l2209_c24_7901
MUX_uxn_opcodes_h_l2209_c24_7901 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2209_c24_7901_cond,
MUX_uxn_opcodes_h_l2209_c24_7901_iftrue,
MUX_uxn_opcodes_h_l2209_c24_7901_iffalse,
MUX_uxn_opcodes_h_l2209_c24_7901_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed
BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_left,
BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_right,
BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d
result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e
CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_return_output,
 n16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
 t16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output,
 n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output,
 t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output,
 n16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_return_output,
 t16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output,
 n16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_return_output,
 t16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output,
 n16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_return_output,
 t16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output,
 n16_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output,
 n16_MUX_uxn_opcodes_h_l2191_c7_b197_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output,
 n16_MUX_uxn_opcodes_h_l2196_c7_811a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output,
 n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_return_output,
 MUX_uxn_opcodes_h_l2203_c32_693c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_return_output,
 MUX_uxn_opcodes_h_l2209_c24_7901_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_994d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2168_c3_7729_uxn_opcodes_h_l2168_c3_7729_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2174_c3_590d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_dafb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_d469 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2186_c3_9363 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2189_c3_aff7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2194_c3_8c75 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2197_c3_c669 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2203_c32_693c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2203_c32_693c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2203_c32_693c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2203_c32_693c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2208_c3_c81c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2209_c24_7901_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2209_c24_7901_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2209_c24_7901_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2209_c24_7901_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2177_l2200_l2185_l2192_DUPLICATE_579e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2199_l2205_DUPLICATE_d093_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2216_l2163_DUPLICATE_442a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_dafb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_dafb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_d469 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2182_c3_d469;
     VAR_MUX_uxn_opcodes_h_l2203_c32_693c_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2209_c24_7901_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2189_c3_aff7 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2189_c3_aff7;
     VAR_MUX_uxn_opcodes_h_l2203_c32_693c_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_994d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_994d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2208_c3_c81c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2208_c3_c81c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2194_c3_8c75 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2194_c3_8c75;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_right := to_unsigned(8, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2174_c3_590d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2174_c3_590d;
     VAR_MUX_uxn_opcodes_h_l2209_c24_7901_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2186_c3_9363 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2186_c3_9363;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2197_c3_c669 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2197_c3_c669;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2205_c11_c1b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2209_c24_97f8] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_left;
     BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_return_output := BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2167_c6_17d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2188_c11_778f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2199_l2205_DUPLICATE_d093 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2199_l2205_DUPLICATE_d093_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2176_c11_5d73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_7689] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_left;
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output := BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_9ebf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2199_c11_6163] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_left;
     BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output := BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2196_c11_3f3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2203_c32_360a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_left;
     BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_return_output := BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2211_c11_11ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_d260] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_left;
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output := BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2191_c11_8b61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_left;
     BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output := BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2177_l2200_l2185_l2192_DUPLICATE_579e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2177_l2200_l2185_l2192_DUPLICATE_579e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2203_c32_360a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2167_c6_17d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_9ebf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_5d73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_d260_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_7689_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2188_c11_778f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2191_c11_8b61_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2196_c11_3f3c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2199_c11_6163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2205_c11_c1b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2211_c11_11ed_return_output;
     VAR_MUX_uxn_opcodes_h_l2209_c24_7901_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2209_c24_97f8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2177_l2200_l2185_l2192_DUPLICATE_579e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2177_l2200_l2185_l2192_DUPLICATE_579e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2177_l2200_l2185_l2192_DUPLICATE_579e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_c952_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2205_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_a915_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2173_l2196_l2167_l2191_l2188_DUPLICATE_87ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2184_l2181_l2176_l2199_l2173_l2196_l2191_l2188_DUPLICATE_ef0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2184_l2211_l2181_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_84f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2199_l2205_DUPLICATE_d093_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2199_l2205_DUPLICATE_d093_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2184_l2181_l2205_l2176_l2199_l2173_l2196_l2167_l2191_l2188_DUPLICATE_41a7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2211_c7_c28d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2205_c7_3c36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;

     -- MUX[uxn_opcodes_h_l2209_c24_7901] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2209_c24_7901_cond <= VAR_MUX_uxn_opcodes_h_l2209_c24_7901_cond;
     MUX_uxn_opcodes_h_l2209_c24_7901_iftrue <= VAR_MUX_uxn_opcodes_h_l2209_c24_7901_iftrue;
     MUX_uxn_opcodes_h_l2209_c24_7901_iffalse <= VAR_MUX_uxn_opcodes_h_l2209_c24_7901_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2209_c24_7901_return_output := MUX_uxn_opcodes_h_l2209_c24_7901_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2203_c32_b65a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_left;
     BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_return_output := BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2200_c3_55d1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_left;
     BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_return_output := BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2185_c3_68a5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_left;
     BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_return_output := BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2205_c7_3c36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2211_c7_c28d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2167_c1_5e55] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2199_c7_7a0a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2203_c32_693c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2203_c32_b65a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2185_c3_68a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2200_c3_55d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2193_l2178_DUPLICATE_0a5e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue := VAR_MUX_uxn_opcodes_h_l2209_c24_7901_return_output;
     VAR_printf_uxn_opcodes_h_l2168_c3_7729_uxn_opcodes_h_l2168_c3_7729_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2167_c1_5e55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2211_c7_c28d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2196_c7_811a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;

     -- MUX[uxn_opcodes_h_l2203_c32_693c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2203_c32_693c_cond <= VAR_MUX_uxn_opcodes_h_l2203_c32_693c_cond;
     MUX_uxn_opcodes_h_l2203_c32_693c_iftrue <= VAR_MUX_uxn_opcodes_h_l2203_c32_693c_iftrue;
     MUX_uxn_opcodes_h_l2203_c32_693c_iffalse <= VAR_MUX_uxn_opcodes_h_l2203_c32_693c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2203_c32_693c_return_output := MUX_uxn_opcodes_h_l2203_c32_693c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2199_c7_7a0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2184_c7_7941] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2184_c7_7941_cond <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_cond;
     t16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue;
     t16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output := t16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2205_c7_3c36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2205_c7_3c36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2205_c7_3c36] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output := result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2199_c7_7a0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;

     -- printf_uxn_opcodes_h_l2168_c3_7729[uxn_opcodes_h_l2168_c3_7729] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2168_c3_7729_uxn_opcodes_h_l2168_c3_7729_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2168_c3_7729_uxn_opcodes_h_l2168_c3_7729_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l2199_c7_7a0a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond;
     n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue;
     n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output := n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue := VAR_MUX_uxn_opcodes_h_l2203_c32_693c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2205_c7_3c36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2196_c7_811a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2196_c7_811a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2199_c7_7a0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2199_c7_7a0a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2181_c7_3273] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2181_c7_3273_cond <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_cond;
     t16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue;
     t16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output := t16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;

     -- n16_MUX[uxn_opcodes_h_l2196_c7_811a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2196_c7_811a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_cond;
     n16_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue;
     n16_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_return_output := n16_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2199_c7_7a0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2199_c7_7a0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2191_c7_b197] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2199_c7_7a0a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;
     -- t16_MUX[uxn_opcodes_h_l2176_c7_c480] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2176_c7_c480_cond <= VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_cond;
     t16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue;
     t16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output := t16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2188_c7_ab71] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2196_c7_811a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2191_c7_b197] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2191_c7_b197_cond <= VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_cond;
     n16_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue;
     n16_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_return_output := n16_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2196_c7_811a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2191_c7_b197] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2196_c7_811a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2196_c7_811a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2191_c7_b197] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2196_c7_811a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;
     -- n16_MUX[uxn_opcodes_h_l2188_c7_ab71] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2188_c7_ab71_cond <= VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_cond;
     n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue;
     n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output := n16_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;

     -- t16_MUX[uxn_opcodes_h_l2173_c7_6ff5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond;
     t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue;
     t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output := t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2188_c7_ab71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2191_c7_b197] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_return_output := result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2191_c7_b197] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2188_c7_ab71] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2191_c7_b197] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2184_c7_7941] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2191_c7_b197] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2191_c7_b197_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;
     -- t16_MUX[uxn_opcodes_h_l2167_c2_131a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2167_c2_131a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_cond;
     t16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue;
     t16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output := t16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2188_c7_ab71] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output := result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2184_c7_7941] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2181_c7_3273] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2188_c7_ab71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_7941] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;

     -- n16_MUX[uxn_opcodes_h_l2184_c7_7941] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2184_c7_7941_cond <= VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_cond;
     n16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue;
     n16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output := n16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2188_c7_ab71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2188_c7_ab71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2188_c7_ab71_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2184_c7_7941] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_3273] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2184_c7_7941] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_return_output := result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2176_c7_c480] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;

     -- n16_MUX[uxn_opcodes_h_l2181_c7_3273] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2181_c7_3273_cond <= VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_cond;
     n16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue;
     n16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output := n16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2181_c7_3273] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_7941] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_7941] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2184_c7_7941_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c7_c480] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2181_c7_3273] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2173_c7_6ff5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_3273] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_3273] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;

     -- n16_MUX[uxn_opcodes_h_l2176_c7_c480] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2176_c7_c480_cond <= VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_cond;
     n16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue;
     n16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output := n16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c7_c480] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2181_c7_3273] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_return_output := result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2181_c7_3273_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2167_c2_131a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c7_c480] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c7_c480] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;

     -- n16_MUX[uxn_opcodes_h_l2173_c7_6ff5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond;
     n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue;
     n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output := n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c7_6ff5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_6ff5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2176_c7_c480] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_return_output := result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2176_c7_c480] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2176_c7_c480_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2173_c7_6ff5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2167_c2_131a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2167_c2_131a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_cond;
     n16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue;
     n16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output := n16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2173_c7_6ff5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2173_c7_6ff5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_6ff5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2167_c2_131a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2167_c2_131a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2173_c7_6ff5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2167_c2_131a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2167_c2_131a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2167_c2_131a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2167_c2_131a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2216_l2163_DUPLICATE_442a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2216_l2163_DUPLICATE_442a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2167_c2_131a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2167_c2_131a_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2216_l2163_DUPLICATE_442a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2216_l2163_DUPLICATE_442a_return_output;
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
