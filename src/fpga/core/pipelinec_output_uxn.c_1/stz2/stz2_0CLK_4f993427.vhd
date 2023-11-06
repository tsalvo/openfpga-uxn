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
-- Submodules: 68
entity stz2_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_4f993427;
architecture arch of stz2_0CLK_4f993427 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1483_c6_9244]
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1483_c1_f640]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1483_c2_64c9]
signal t8_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1483_c2_64c9]
signal n16_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1483_c2_64c9]
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1483_c2_64c9]
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c2_64c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c2_64c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c2_64c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c2_64c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c2_64c9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1484_c3_df57[uxn_opcodes_h_l1484_c3_df57]
signal printf_uxn_opcodes_h_l1484_c3_df57_uxn_opcodes_h_l1484_c3_df57_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_4b68]
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1488_c7_e3fe]
signal t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1488_c7_e3fe]
signal n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1488_c7_e3fe]
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1488_c7_e3fe]
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_e3fe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_e3fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_e3fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_e3fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1488_c7_e3fe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_7a88]
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1491_c7_4ba7]
signal t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1491_c7_4ba7]
signal n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_4ba7]
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_4ba7]
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_4ba7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_4ba7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1491_c7_4ba7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_4ba7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_4ba7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_4a96]
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1495_c7_3ef6]
signal n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_3ef6]
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_3ef6]
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_3ef6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_3ef6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_3ef6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1495_c7_3ef6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1497_c3_a546]
signal CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_7ef7]
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1499_c7_5016]
signal n16_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_5016]
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_5016]
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_5016]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_5016]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c7_5016]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_5016]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1500_c3_97c4]
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1502_c30_eab0]
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1505_c31_f681]
signal CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_3a0d]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_0148]
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_0148]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_0148]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_0148]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_0148]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1509_c33_a373]
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_e79f]
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_f2c7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_f2c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c878( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_left,
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_right,
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_return_output);

-- t8_MUX_uxn_opcodes_h_l1483_c2_64c9
t8_MUX_uxn_opcodes_h_l1483_c2_64c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1483_c2_64c9_cond,
t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue,
t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse,
t8_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

-- n16_MUX_uxn_opcodes_h_l1483_c2_64c9
n16_MUX_uxn_opcodes_h_l1483_c2_64c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1483_c2_64c9_cond,
n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue,
n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse,
n16_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

-- printf_uxn_opcodes_h_l1484_c3_df57_uxn_opcodes_h_l1484_c3_df57
printf_uxn_opcodes_h_l1484_c3_df57_uxn_opcodes_h_l1484_c3_df57 : entity work.printf_uxn_opcodes_h_l1484_c3_df57_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1484_c3_df57_uxn_opcodes_h_l1484_c3_df57_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_left,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_right,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output);

-- t8_MUX_uxn_opcodes_h_l1488_c7_e3fe
t8_MUX_uxn_opcodes_h_l1488_c7_e3fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond,
t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue,
t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse,
t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output);

-- n16_MUX_uxn_opcodes_h_l1488_c7_e3fe
n16_MUX_uxn_opcodes_h_l1488_c7_e3fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond,
n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue,
n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse,
n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_left,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_right,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output);

-- t8_MUX_uxn_opcodes_h_l1491_c7_4ba7
t8_MUX_uxn_opcodes_h_l1491_c7_4ba7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond,
t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue,
t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse,
t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output);

-- n16_MUX_uxn_opcodes_h_l1491_c7_4ba7
n16_MUX_uxn_opcodes_h_l1491_c7_4ba7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond,
n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue,
n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse,
n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_left,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_right,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output);

-- n16_MUX_uxn_opcodes_h_l1495_c7_3ef6
n16_MUX_uxn_opcodes_h_l1495_c7_3ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond,
n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue,
n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse,
n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1497_c3_a546
CONST_SL_8_uxn_opcodes_h_l1497_c3_a546 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_x,
CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_left,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_right,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output);

-- n16_MUX_uxn_opcodes_h_l1499_c7_5016
n16_MUX_uxn_opcodes_h_l1499_c7_5016 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1499_c7_5016_cond,
n16_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue,
n16_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse,
n16_MUX_uxn_opcodes_h_l1499_c7_5016_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4
BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_left,
BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_right,
BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0
sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_ins,
sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_x,
sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_y,
sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1505_c31_f681
CONST_SR_8_uxn_opcodes_h_l1505_c31_f681 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_x,
CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_left,
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_right,
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_left,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_right,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_return_output,
 t8_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
 n16_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output,
 t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output,
 n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output,
 t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output,
 n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output,
 n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output,
 CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output,
 n16_MUX_uxn_opcodes_h_l1499_c7_5016_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_return_output,
 CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_fbe8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1484_c3_df57_uxn_opcodes_h_l1484_c3_df57_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_2796 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_48f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_4ba7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_5f36_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_50ee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_8612_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_b049_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_c4d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_3015_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_787e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1488_l1483_l1499_l1495_l1491_DUPLICATE_0b5c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1488_l1483_l1512_l1507_l1495_l1491_DUPLICATE_61bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1488_l1512_l1507_l1499_l1495_l1491_DUPLICATE_00ff_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_bae1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1517_l1477_DUPLICATE_8dea_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_2796 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_2796;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_fbe8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_fbe8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_48f4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_48f4;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_4b68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_left;
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output := BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1488_l1512_l1507_l1499_l1495_l1491_DUPLICATE_00ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1488_l1512_l1507_l1499_l1495_l1491_DUPLICATE_00ff_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_bae1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_bae1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1502_c30_eab0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_ins;
     sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_x;
     sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_return_output := sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1483_c6_9244] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_left;
     BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output := BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_4ba7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_787e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_787e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_7ef7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_4a96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_left;
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output := BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1488_l1483_l1499_l1495_l1491_DUPLICATE_0b5c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1488_l1483_l1499_l1495_l1491_DUPLICATE_0b5c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_7a88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_left;
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output := BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1488_l1483_l1512_l1507_l1495_l1491_DUPLICATE_61bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1488_l1483_l1512_l1507_l1495_l1491_DUPLICATE_61bd_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_c4d8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_c4d8_return_output := result.u16_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1510_c21_b049] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_b049_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_3a0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1504_c22_5f36] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_5f36_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_3015 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_3015_return_output := result.u8_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1509_c33_a373] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_e79f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_9244_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_4b68_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_7a88_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_4a96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_7ef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_3a0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_e79f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_5f36_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_bae1_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1496_l1500_DUPLICATE_bae1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_b049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1488_l1483_l1499_l1495_l1491_DUPLICATE_0b5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1488_l1483_l1499_l1495_l1491_DUPLICATE_0b5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1488_l1483_l1499_l1495_l1491_DUPLICATE_0b5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1488_l1483_l1499_l1495_l1491_DUPLICATE_0b5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1488_l1483_l1499_l1495_l1491_DUPLICATE_0b5c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_c4d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_c4d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_c4d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_c4d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_c4d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1488_l1512_l1507_l1499_l1495_l1491_DUPLICATE_00ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1488_l1512_l1507_l1499_l1495_l1491_DUPLICATE_00ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1488_l1512_l1507_l1499_l1495_l1491_DUPLICATE_00ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1488_l1512_l1507_l1499_l1495_l1491_DUPLICATE_00ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1488_l1512_l1507_l1499_l1495_l1491_DUPLICATE_00ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1488_l1512_l1507_l1499_l1495_l1491_DUPLICATE_00ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1488_l1483_l1512_l1507_l1495_l1491_DUPLICATE_61bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1488_l1483_l1512_l1507_l1495_l1491_DUPLICATE_61bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1488_l1483_l1512_l1507_l1495_l1491_DUPLICATE_61bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1488_l1483_l1512_l1507_l1495_l1491_DUPLICATE_61bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1488_l1483_l1512_l1507_l1495_l1491_DUPLICATE_61bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1488_l1483_l1512_l1507_l1495_l1491_DUPLICATE_61bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_787e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_787e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_787e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_787e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_787e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_3015_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_3015_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_3015_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_3015_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1488_l1483_l1507_l1495_l1491_DUPLICATE_3015_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_eab0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1483_c1_f640] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1509_c22_8612] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_8612_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_a373_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1500_c3_97c4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_left;
     BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_return_output := BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_0148] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_f2c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_0148] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1497_c3_a546] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_return_output := CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_f2c7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond;
     t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue;
     t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output := t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c7_5016] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_97c4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_8612_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_a546_return_output;
     VAR_printf_uxn_opcodes_h_l1484_c3_df57_uxn_opcodes_h_l1484_c3_df57_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_f640_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_f2c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     -- CONST_SR_8[uxn_opcodes_h_l1505_c31_f681] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_return_output := CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_return_output;

     -- printf_uxn_opcodes_h_l1484_c3_df57[uxn_opcodes_h_l1484_c3_df57] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1484_c3_df57_uxn_opcodes_h_l1484_c3_df57_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1484_c3_df57_uxn_opcodes_h_l1484_c3_df57_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_0148] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output := result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_0148] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;

     -- n16_MUX[uxn_opcodes_h_l1499_c7_5016] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1499_c7_5016_cond <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_cond;
     n16_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue;
     n16_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_return_output := n16_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;

     -- t8_MUX[uxn_opcodes_h_l1488_c7_e3fe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond;
     t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue;
     t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output := t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_3ef6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_0148] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_5016] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_e3fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_0148_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_5016] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1505_c21_50ee] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_50ee_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f681_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_3ef6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c2_64c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_5016] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output := result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_5016] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;

     -- t8_MUX[uxn_opcodes_h_l1483_c2_64c9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1483_c2_64c9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_cond;
     t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue;
     t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output := t8_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1495_c7_3ef6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond;
     n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue;
     n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output := n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_50ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_e3fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1495_c7_3ef6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_3ef6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond;
     n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue;
     n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output := n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_3ef6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_5016] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output := result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_5016_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_e3fe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c2_64c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_3ef6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1488_c7_e3fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond;
     n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue;
     n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output := n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_3ef6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c2_64c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1488_c7_e3fe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output := result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_e3fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1483_c2_64c9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1483_c2_64c9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_cond;
     n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue;
     n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output := n16_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1488_c7_e3fe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_4ba7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_4ba7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1488_c7_e3fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1483_c2_64c9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c2_64c9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c2_64c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_e3fe_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1483_c2_64c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1517_l1477_DUPLICATE_8dea LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1517_l1477_DUPLICATE_8dea_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c878(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_64c9_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1517_l1477_DUPLICATE_8dea_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1517_l1477_DUPLICATE_8dea_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
