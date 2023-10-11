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
-- Submodules: 76
entity lda_0CLK_c26dda62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_c26dda62;
architecture arch of lda_0CLK_c26dda62 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1509_c6_8e31]
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1509_c1_ba04]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c2_8a88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1509_c2_8a88]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1509_c2_8a88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1509_c2_8a88]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c2_8a88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1509_c2_8a88]
signal result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1509_c2_8a88]
signal result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1509_c2_8a88]
signal tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1509_c2_8a88]
signal t16_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1510_c3_7b99[uxn_opcodes_h_l1510_c3_7b99]
signal printf_uxn_opcodes_h_l1510_c3_7b99_uxn_opcodes_h_l1510_c3_7b99_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_1ffb]
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1514_c7_2f1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1514_c7_2f1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_2f1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1514_c7_2f1a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_2f1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1514_c7_2f1a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1514_c7_2f1a]
signal result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1514_c7_2f1a]
signal tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1514_c7_2f1a]
signal t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1517_c11_3331]
signal BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1517_c7_aa30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1517_c7_aa30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1517_c7_aa30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1517_c7_aa30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1517_c7_aa30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1517_c7_aa30]
signal result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1517_c7_aa30]
signal result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1517_c7_aa30]
signal tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1517_c7_aa30]
signal t16_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1519_c3_d765]
signal CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_ac0e]
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1522_c7_eec3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_eec3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_eec3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_eec3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_eec3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1522_c7_eec3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1522_c7_eec3]
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1522_c7_eec3]
signal tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1522_c7_eec3]
signal t16_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1525_c11_36d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1525_c7_8c40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1525_c7_8c40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1525_c7_8c40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1525_c7_8c40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1525_c7_8c40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1525_c7_8c40]
signal result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1525_c7_8c40]
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1525_c7_8c40]
signal tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1525_c7_8c40]
signal t16_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1526_c3_8640]
signal BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1528_c32_5142]
signal BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1528_c32_d6d4]
signal BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1528_c32_a4a5]
signal MUX_uxn_opcodes_h_l1528_c32_a4a5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1528_c32_a4a5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1528_c32_a4a5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1528_c32_a4a5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1531_c11_3405]
signal BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1531_c7_231b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1531_c7_231b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1531_c7_231b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1531_c7_231b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1531_c7_231b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1531_c7_231b]
signal result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1531_c7_231b]
signal tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_120f]
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1535_c7_9c71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_9c71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1535_c7_9c71]
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_9c71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1535_c7_9c71]
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1541_c11_6f87]
signal BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1541_c7_33ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1541_c7_33ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3413( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31
BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_left,
BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_right,
BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88
result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88
result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_cond,
result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88
tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_cond,
tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue,
tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse,
tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

-- t16_MUX_uxn_opcodes_h_l1509_c2_8a88
t16_MUX_uxn_opcodes_h_l1509_c2_8a88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1509_c2_8a88_cond,
t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue,
t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse,
t16_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

-- printf_uxn_opcodes_h_l1510_c3_7b99_uxn_opcodes_h_l1510_c3_7b99
printf_uxn_opcodes_h_l1510_c3_7b99_uxn_opcodes_h_l1510_c3_7b99 : entity work.printf_uxn_opcodes_h_l1510_c3_7b99_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1510_c3_7b99_uxn_opcodes_h_l1510_c3_7b99_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_left,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_right,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a
tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond,
tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output);

-- t16_MUX_uxn_opcodes_h_l1514_c7_2f1a
t16_MUX_uxn_opcodes_h_l1514_c7_2f1a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond,
t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue,
t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse,
t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331
BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_left,
BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_right,
BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30
result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30
result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30
result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30
result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30
result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30
result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_cond,
result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30
tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_cond,
tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue,
tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse,
tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output);

-- t16_MUX_uxn_opcodes_h_l1517_c7_aa30
t16_MUX_uxn_opcodes_h_l1517_c7_aa30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1517_c7_aa30_cond,
t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue,
t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse,
t16_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1519_c3_d765
CONST_SL_8_uxn_opcodes_h_l1519_c3_d765 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_x,
CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_left,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_right,
BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3
tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_cond,
tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue,
tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse,
tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output);

-- t16_MUX_uxn_opcodes_h_l1522_c7_eec3
t16_MUX_uxn_opcodes_h_l1522_c7_eec3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1522_c7_eec3_cond,
t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue,
t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse,
t16_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_cond,
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40
tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_cond,
tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue,
tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse,
tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output);

-- t16_MUX_uxn_opcodes_h_l1525_c7_8c40
t16_MUX_uxn_opcodes_h_l1525_c7_8c40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1525_c7_8c40_cond,
t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue,
t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse,
t16_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640
BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_left,
BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_right,
BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142
BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_left,
BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_right,
BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4
BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_left,
BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_right,
BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_return_output);

-- MUX_uxn_opcodes_h_l1528_c32_a4a5
MUX_uxn_opcodes_h_l1528_c32_a4a5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1528_c32_a4a5_cond,
MUX_uxn_opcodes_h_l1528_c32_a4a5_iftrue,
MUX_uxn_opcodes_h_l1528_c32_a4a5_iffalse,
MUX_uxn_opcodes_h_l1528_c32_a4a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405
BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_left,
BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_right,
BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b
result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1531_c7_231b
tmp8_MUX_uxn_opcodes_h_l1531_c7_231b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_cond,
tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue,
tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse,
tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_left,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_right,
BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_cond,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71
tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_cond,
tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue,
tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse,
tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87
BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_left,
BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_right,
BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea
result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
 tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
 t16_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output,
 t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output,
 tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output,
 t16_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output,
 CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output,
 tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output,
 t16_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output,
 tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output,
 t16_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_return_output,
 MUX_uxn_opcodes_h_l1528_c32_a4a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_return_output,
 tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output,
 tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1511_c3_4bf7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1510_c3_7b99_uxn_opcodes_h_l1510_c3_7b99_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1515_c3_956e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_cffa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1523_c3_37b0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1538_c3_e51b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1525_l1514_l1517_l1509_l1522_DUPLICATE_5d88_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_0195_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_69a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1518_DUPLICATE_6406_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1531_l1525_l1535_DUPLICATE_ffbb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1504_l1546_DUPLICATE_30b6_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_cffa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1520_c3_cffa;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1515_c3_956e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1515_c3_956e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1538_c3_e51b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1538_c3_e51b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1523_c3_37b0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1523_c3_37b0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1511_c3_4bf7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1511_c3_4bf7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_right := to_unsigned(128, 8);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse := tmp8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1531_l1525_l1535_DUPLICATE_ffbb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1531_l1525_l1535_DUPLICATE_ffbb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_69a8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_69a8_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1535_c11_120f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1518_DUPLICATE_6406 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1518_DUPLICATE_6406_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_1ffb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1517_c11_3331] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_left;
     BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output := BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1509_c6_8e31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_left;
     BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output := BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1525_c11_36d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1531_c11_3405] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_left;
     BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output := BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_0195 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_0195_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1522_c11_ac0e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1525_l1514_l1517_l1509_l1522_DUPLICATE_5d88 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1525_l1514_l1517_l1509_l1522_DUPLICATE_5d88_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1541_c11_6f87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_left;
     BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_return_output := BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1528_c32_5142] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_left;
     BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_return_output := BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1528_c32_5142_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c6_8e31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_1ffb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1517_c11_3331_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1522_c11_ac0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1525_c11_36d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1531_c11_3405_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1535_c11_120f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1541_c11_6f87_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1518_DUPLICATE_6406_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1526_l1518_DUPLICATE_6406_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1525_l1514_l1517_l1509_l1522_DUPLICATE_5d88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1525_l1514_l1517_l1509_l1522_DUPLICATE_5d88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1525_l1514_l1517_l1509_l1522_DUPLICATE_5d88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1525_l1514_l1517_l1509_l1522_DUPLICATE_5d88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1525_l1514_l1517_l1509_l1522_DUPLICATE_5d88_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_69a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_69a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_69a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_69a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_69a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1541_l1517_l1522_l1531_DUPLICATE_adae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_0195_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_0195_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_0195_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_0195_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1514_l1517_l1509_l1522_l1531_DUPLICATE_0195_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1525_l1514_l1541_l1517_l1509_l1522_l1531_DUPLICATE_7715_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1531_l1525_l1535_DUPLICATE_ffbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1531_l1525_l1535_DUPLICATE_ffbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1531_l1525_l1535_DUPLICATE_ffbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1535_l1525_l1514_l1517_l1509_l1522_l1531_DUPLICATE_925b_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1519_c3_d765] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_return_output := CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1531_c7_231b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1535_c7_9c71] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_cond;
     tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output := tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1509_c1_ba04] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1535_c7_9c71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1535_c7_9c71] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output := result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1526_c3_8640] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_left;
     BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_return_output := BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1531_c7_231b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1541_c7_33ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1528_c32_d6d4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_left;
     BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_return_output := BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1541_c7_33ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1528_c32_d6d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1526_c3_8640_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1519_c3_d765_return_output;
     VAR_printf_uxn_opcodes_h_l1510_c3_7b99_uxn_opcodes_h_l1510_c3_7b99_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1509_c1_ba04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1541_c7_33ea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1525_c7_8c40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1531_c7_231b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_cond;
     tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_return_output := tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;

     -- MUX[uxn_opcodes_h_l1528_c32_a4a5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1528_c32_a4a5_cond <= VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_cond;
     MUX_uxn_opcodes_h_l1528_c32_a4a5_iftrue <= VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_iftrue;
     MUX_uxn_opcodes_h_l1528_c32_a4a5_iffalse <= VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_return_output := MUX_uxn_opcodes_h_l1528_c32_a4a5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1525_c7_8c40] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1525_c7_8c40_cond <= VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_cond;
     t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue;
     t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output := t16_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1525_c7_8c40] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1535_c7_9c71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1535_c7_9c71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1531_c7_231b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1531_c7_231b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;

     -- printf_uxn_opcodes_h_l1510_c3_7b99[uxn_opcodes_h_l1510_c3_7b99] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1510_c3_7b99_uxn_opcodes_h_l1510_c3_7b99_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1510_c3_7b99_uxn_opcodes_h_l1510_c3_7b99_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue := VAR_MUX_uxn_opcodes_h_l1528_c32_a4a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1535_c7_9c71_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1522_c7_eec3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1525_c7_8c40] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_cond;
     tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output := tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1525_c7_8c40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1531_c7_231b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1522_c7_eec3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1531_c7_231b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1525_c7_8c40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1525_c7_8c40] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output := result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;

     -- t16_MUX[uxn_opcodes_h_l1522_c7_eec3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1522_c7_eec3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_cond;
     t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue;
     t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output := t16_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1531_c7_231b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1522_c7_eec3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1517_c7_aa30] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1525_c7_8c40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;

     -- t16_MUX[uxn_opcodes_h_l1517_c7_aa30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1517_c7_aa30_cond <= VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_cond;
     t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue;
     t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output := t16_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1522_c7_eec3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1517_c7_aa30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1522_c7_eec3] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_cond;
     tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output := tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1522_c7_eec3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1525_c7_8c40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1525_c7_8c40_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1514_c7_2f1a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1522_c7_eec3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1514_c7_2f1a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1517_c7_aa30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1522_c7_eec3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1517_c7_aa30] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output := result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;

     -- t16_MUX[uxn_opcodes_h_l1514_c7_2f1a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond;
     t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue;
     t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output := t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1517_c7_aa30] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_cond;
     tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output := tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1517_c7_aa30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1522_c7_eec3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;
     -- t16_MUX[uxn_opcodes_h_l1509_c2_8a88] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1509_c2_8a88_cond <= VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_cond;
     t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue;
     t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output := t16_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_2f1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1514_c7_2f1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1509_c2_8a88] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1514_c7_2f1a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1514_c7_2f1a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond;
     tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output := tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1517_c7_aa30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1509_c2_8a88] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1517_c7_aa30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1517_c7_aa30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1509_c2_8a88] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output := result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1509_c2_8a88] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_cond;
     tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output := tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1509_c2_8a88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_2f1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1514_c7_2f1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1509_c2_8a88] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_2f1a_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c2_8a88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c2_8a88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1504_l1546_DUPLICATE_30b6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1504_l1546_DUPLICATE_30b6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3413(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1509_c2_8a88_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1504_l1546_DUPLICATE_30b6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1504_l1546_DUPLICATE_30b6_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
