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
-- Submodules: 58
entity sta_0CLK_d2dce55b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_d2dce55b;
architecture arch of sta_0CLK_d2dce55b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2168_c6_d1e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2168_c1_c291]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2168_c2_8a09]
signal n8_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2168_c2_8a09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2168_c2_8a09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2168_c2_8a09]
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2168_c2_8a09]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2168_c2_8a09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2168_c2_8a09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2168_c2_8a09]
signal result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2168_c2_8a09]
signal t16_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2169_c3_2436[uxn_opcodes_h_l2169_c3_2436]
signal printf_uxn_opcodes_h_l2169_c3_2436_uxn_opcodes_h_l2169_c3_2436_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_f445]
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2173_c7_606c]
signal n8_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_606c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2173_c7_606c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2173_c7_606c]
signal result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2173_c7_606c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_606c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c7_606c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2173_c7_606c]
signal result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2173_c7_606c]
signal t16_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2176_c11_0c4e]
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2176_c7_cbb7]
signal n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c7_cbb7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c7_cbb7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2176_c7_cbb7]
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c7_cbb7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c7_cbb7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c7_cbb7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2176_c7_cbb7]
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2176_c7_cbb7]
signal t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2178_c3_5ebb]
signal CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_4e8b]
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2181_c7_fa05]
signal n8_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_fa05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_fa05]
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_fa05]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_fa05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_fa05]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_fa05]
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2181_c7_fa05]
signal t16_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2182_c3_c4e5]
signal BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_fc86]
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2184_c7_02d9]
signal n8_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_02d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_02d9]
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_02d9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_02d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_02d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_02d9]
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2187_c30_2f61]
signal sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2192_c11_c985]
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2192_c7_81db]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2192_c7_81db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2192_c7_81db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_18d1( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.u16_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0
BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_return_output);

-- n8_MUX_uxn_opcodes_h_l2168_c2_8a09
n8_MUX_uxn_opcodes_h_l2168_c2_8a09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2168_c2_8a09_cond,
n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue,
n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse,
n8_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09
result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond,
result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09
result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09
result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond,
result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

-- t16_MUX_uxn_opcodes_h_l2168_c2_8a09
t16_MUX_uxn_opcodes_h_l2168_c2_8a09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2168_c2_8a09_cond,
t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue,
t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse,
t16_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

-- printf_uxn_opcodes_h_l2169_c3_2436_uxn_opcodes_h_l2169_c3_2436
printf_uxn_opcodes_h_l2169_c3_2436_uxn_opcodes_h_l2169_c3_2436 : entity work.printf_uxn_opcodes_h_l2169_c3_2436_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2169_c3_2436_uxn_opcodes_h_l2169_c3_2436_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_left,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_right,
BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output);

-- n8_MUX_uxn_opcodes_h_l2173_c7_606c
n8_MUX_uxn_opcodes_h_l2173_c7_606c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2173_c7_606c_cond,
n8_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue,
n8_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse,
n8_MUX_uxn_opcodes_h_l2173_c7_606c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c
result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c
result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output);

-- t16_MUX_uxn_opcodes_h_l2173_c7_606c
t16_MUX_uxn_opcodes_h_l2173_c7_606c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2173_c7_606c_cond,
t16_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue,
t16_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse,
t16_MUX_uxn_opcodes_h_l2173_c7_606c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_left,
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_right,
BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output);

-- n8_MUX_uxn_opcodes_h_l2176_c7_cbb7
n8_MUX_uxn_opcodes_h_l2176_c7_cbb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond,
n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue,
n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse,
n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7
result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7
result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond,
result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output);

-- t16_MUX_uxn_opcodes_h_l2176_c7_cbb7
t16_MUX_uxn_opcodes_h_l2176_c7_cbb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond,
t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue,
t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse,
t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb
CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_x,
CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_left,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_right,
BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output);

-- n8_MUX_uxn_opcodes_h_l2181_c7_fa05
n8_MUX_uxn_opcodes_h_l2181_c7_fa05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2181_c7_fa05_cond,
n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue,
n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse,
n8_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output);

-- t16_MUX_uxn_opcodes_h_l2181_c7_fa05
t16_MUX_uxn_opcodes_h_l2181_c7_fa05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2181_c7_fa05_cond,
t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue,
t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse,
t16_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5
BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_left,
BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_right,
BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_left,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_right,
BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output);

-- n8_MUX_uxn_opcodes_h_l2184_c7_02d9
n8_MUX_uxn_opcodes_h_l2184_c7_02d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2184_c7_02d9_cond,
n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue,
n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse,
n8_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61
sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_ins,
sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_x,
sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_y,
sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_left,
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_right,
BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_return_output,
 n8_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
 t16_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output,
 n8_MUX_uxn_opcodes_h_l2173_c7_606c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output,
 t16_MUX_uxn_opcodes_h_l2173_c7_606c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output,
 n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output,
 t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output,
 CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output,
 n8_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output,
 t16_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output,
 n8_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output,
 sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_e11d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2169_c3_2436_uxn_opcodes_h_l2169_c3_2436_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2174_c3_9b7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_92ff : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2176_c7_cbb7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_8e72_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_b00f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f4a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f9e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_cb20_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2176_l2173_l2192_l2184_l2181_DUPLICATE_7896_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2177_DUPLICATE_3201_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2163_l2198_DUPLICATE_f6b1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_92ff := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2179_c3_92ff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_e11d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2170_c3_e11d;
     VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2174_c3_9b7f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2174_c3_9b7f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2168_c6_d1e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f4a_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2177_DUPLICATE_3201 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2177_DUPLICATE_3201_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f9e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f9e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2184_c11_fc86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_left;
     BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output := BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2173_c11_f445] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_left;
     BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output := BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2176_c7_cbb7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2176_c11_0c4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_8e72 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_8e72_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_b00f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_b00f_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_cb20 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_cb20_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l2187_c30_2f61] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_ins;
     sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_x;
     sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_return_output := sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2176_l2173_l2192_l2184_l2181_DUPLICATE_7896 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2176_l2173_l2192_l2184_l2181_DUPLICATE_7896_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2192_c11_c985] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_left;
     BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_return_output := BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2181_c11_4e8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2168_c6_d1e0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2173_c11_f445_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2176_c11_0c4e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2181_c11_4e8b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2184_c11_fc86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2192_c11_c985_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2177_DUPLICATE_3201_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2182_l2177_DUPLICATE_3201_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_8e72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_8e72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_8e72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_8e72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_8e72_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_cb20_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_cb20_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_cb20_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_cb20_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_cb20_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2176_l2173_l2192_l2184_l2181_DUPLICATE_7896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2176_l2173_l2192_l2184_l2181_DUPLICATE_7896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2176_l2173_l2192_l2184_l2181_DUPLICATE_7896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2176_l2173_l2192_l2184_l2181_DUPLICATE_7896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2176_l2173_l2192_l2184_l2181_DUPLICATE_7896_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f4a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f4a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f4a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f4a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2192_l2181_DUPLICATE_3f9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_b00f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_b00f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_b00f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_b00f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2176_l2173_l2168_l2184_l2181_DUPLICATE_b00f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2187_c30_2f61_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2168_c1_c291] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2184_c7_02d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2178_c3_5ebb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_return_output := CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2184_c7_02d9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output := result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;

     -- n8_MUX[uxn_opcodes_h_l2184_c7_02d9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2184_c7_02d9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_cond;
     n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue;
     n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output := n8_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2192_c7_81db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2192_c7_81db] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2184_c7_02d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2182_c3_c4e5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_left;
     BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_return_output := BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2192_c7_81db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2182_c3_c4e5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2178_c3_5ebb_return_output;
     VAR_printf_uxn_opcodes_h_l2169_c3_2436_uxn_opcodes_h_l2169_c3_2436_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2168_c1_c291_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2192_c7_81db_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2192_c7_81db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2192_c7_81db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2184_c7_02d9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;

     -- printf_uxn_opcodes_h_l2169_c3_2436[uxn_opcodes_h_l2169_c3_2436] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2169_c3_2436_uxn_opcodes_h_l2169_c3_2436_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2169_c3_2436_uxn_opcodes_h_l2169_c3_2436_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2184_c7_02d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2181_c7_fa05] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output := result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2181_c7_fa05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output := result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2184_c7_02d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2181_c7_fa05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2173_c7_606c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2181_c7_fa05] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2181_c7_fa05_cond <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_cond;
     n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue;
     n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output := n8_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;

     -- t16_MUX[uxn_opcodes_h_l2181_c7_fa05] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2181_c7_fa05_cond <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_cond;
     t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue;
     t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output := t16_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2184_c7_02d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2181_c7_fa05] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2181_c7_fa05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond;
     t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue;
     t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output := t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output := result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2181_c7_fa05] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2168_c2_8a09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;

     -- n8_MUX[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond <= VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond;
     n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue;
     n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output := n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2181_c7_fa05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2173_c7_606c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2173_c7_606c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2173_c7_606c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_cond;
     n8_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue;
     n8_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_return_output := n8_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2176_c7_cbb7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2173_c7_606c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2173_c7_606c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_cond;
     t16_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue;
     t16_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_return_output := t16_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2173_c7_606c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2173_c7_606c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2176_c7_cbb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2168_c2_8a09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;

     -- n8_MUX[uxn_opcodes_h_l2168_c2_8a09] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2168_c2_8a09_cond <= VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_cond;
     n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue;
     n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output := n8_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2173_c7_606c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2173_c7_606c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2168_c2_8a09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output := result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2173_c7_606c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2168_c2_8a09] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2168_c2_8a09_cond <= VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_cond;
     t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue;
     t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output := t16_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2168_c2_8a09] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output := result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2173_c7_606c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2168_c2_8a09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2168_c2_8a09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2168_c2_8a09] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2163_l2198_DUPLICATE_f6b1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2163_l2198_DUPLICATE_f6b1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_18d1(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2168_c2_8a09_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2163_l2198_DUPLICATE_f6b1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l2163_l2198_DUPLICATE_f6b1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
